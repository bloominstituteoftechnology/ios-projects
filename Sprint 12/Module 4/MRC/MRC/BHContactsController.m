//
//  BHContactsController.m
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHContactsController.h"
#import "BHContact.h"

@interface BHContactsController()

@end

static BHContactsController *shared = nil;

@implementation BHContactsController

@synthesize contacts;

#pragma mark Singleton Methods
+ (id)shared {
    @synchronized(self) {
        if(shared == nil){
            shared = [[super allocWithZone:NULL] init];
        }
    }
    return shared;
}
+ (id)allocWithZone:(NSZone *)zone {
    return [[self shared] retain];
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
- (id)retain {
    return self;
}
- (unsigned)retainCount {
    return UINT_MAX; //denotes an object that cannot be released
}
- (oneway void)release {
    // never release
}
- (id)autorelease {
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
    [contacts release];
    [_fileManager release];
    [super dealloc];
}

-(instancetype)init{
    self = [super init];
    if (self) {
        
        // file manager setup
        _fileManager = [[NSFileManager alloc] init];
        [_fileManager autorelease];
        _fileManager = [NSFileManager defaultManager];
        NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
        [_fileManager contentsOfDirectoryAtURL:documentsDirectoryURL includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
        
        if (![self getContactsFromDisk]) {
            contacts = [[NSMutableArray<BHContact *> alloc] init];
        } else {
            contacts = [self getContactsFromDisk];
        }
        
    }
    return self;
}

// create
-(void)createContact: (BHContact *)contact{
    NSLog(contacts);
    [contacts addObject:contact];
    
    [self saveContactsToDisk];
}

// update
-(void)updateContact: (BHContact *)updatedContact{
    NSUInteger j = [contacts count];
    
    for (int q = 0; q < j; q++)
    {
        BHContact *thisObject = [contacts objectAtIndex:q];
        BOOL shouldUpdateThisObject = ([updatedContact uuid] == [thisObject uuid]);
        if (shouldUpdateThisObject){
            [contacts removeObjectAtIndex:q];
            [contacts insertObject:updatedContact atIndex:q];
            break;
        }
    }
    
    [self saveContactsToDisk];
}

// delete
-(void)deleteContact: (BHContact *)songToDelete{
    [contacts removeObject:songToDelete];
    [self saveContactsToDisk];
}

// save to local storage
-(void)saveContactsToDisk {
    
    // get the document directory URL
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    // append our file name
    NSURL *url = [documentsDirectoryURL URLByAppendingPathComponent:@"Contacts.data" isDirectory:NO];
    
    NSUInteger j = [contacts count];
    
    NSMutableArray *topLevelArray = [[NSMutableArray alloc] init];
    
    for (int q = 0; q < j; q++)
    {
        
        BHContact *thisObject = [contacts objectAtIndex:q];
        
        NSDictionary *newDictionary = [thisObject makeDictionaryFromContact:thisObject];
        
        [topLevelArray addObject:newDictionary];
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:topLevelArray options:NSJSONWritingPrettyPrinted error:nil];
    [topLevelArray release];
    
    if (![data writeToURL:url atomically:YES]) {
        NSLog(@"Failed to writeToURL:'%@'", url);
    }
    
    
}

-(NSMutableArray*)getContactsFromDisk {
    
    // get the document directory URL
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    // append our file name
    NSURL *url = [documentsDirectoryURL URLByAppendingPathComponent:@"Contacts.data" isDirectory:NO];
    
    NSData* data = [NSData dataWithContentsOfURL:url];
    NSMutableArray *objects;
    
    @try {
        objects = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    } @catch (NSException* error) {
        NSLog(@"Error Decoding Data: %@", error);
        NSMutableArray *newArray = [[NSMutableArray<BHContact *> alloc] init];
        [newArray autorelease];
        return newArray;
    }
    
    NSUInteger j = [objects count];
    
    NSMutableArray *newArray = [[NSMutableArray<BHContact *> alloc] init];
    [newArray autorelease];
    
    
    for (int q = 0; q < j; q++)
    {
        
        NSDictionary *thisObject = [objects objectAtIndex:q];
        
        BHContact *newContact = [[BHContact alloc] initWithName:[thisObject objectForKey:@"name"] email:[thisObject objectForKey:@"email"] phoneNumber:[thisObject objectForKey:@"phoneNumber"] uuid:[thisObject objectForKey:@"uuid"]];
        [newArray addObject:newContact];
        [newContact release];
    }
    
    return newArray;
    
}


@end
