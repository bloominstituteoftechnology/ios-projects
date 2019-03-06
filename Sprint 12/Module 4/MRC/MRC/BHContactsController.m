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
        if(shared == nil)
            shared = [[super allocWithZone:NULL] init];
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
- (id)init {
    if (self = [super init]) {
        contacts = [[NSMutableArray<BHContact *> alloc] init];
    }
    return self;
}
- (void)dealloc {
    // Should never be called, but just here for clarity really.
    [contacts release];
    [super dealloc];
}

-(instancetype)init{
    self = [super init];
    if (self) {
        
        // file manager setup
        _fileManager = [[NSFileManager alloc] init];
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
-(void)createContact: (BHContact *)song{
    [contacts addObject:song];
    
    [self saveContactsToDisk];
}

// update
-(void)updateContact: (BHContact *)updatedContact{
    NSUInteger j = [contacts count];
    
    for (int q = 0; q < j; q++)
    {
        BHContact *thisObject = [contacts objectAtIndex:q];
        BOOL shouldUpdateThisObject = ([updatedContact UUID] == [thisObject UUID]);
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
    
    NSMutableArray *objects = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSUInteger j = [objects count];
    
    NSMutableArray *newArray = [[NSMutableArray<BHContact *> alloc] init];
    
    for (int q = 0; q < j; q++)
    {
        
        NSDictionary *thisObject = [objects objectAtIndex:q];
        
        BHContact *newContact = [[BHContact alloc] initWithName:[thisObject objectForKey:@"name"] email:[thisObject objectForKey:@"email"] phoneNumber:[thisObject objectForKey:@"phoneNumber"]]];
        
        [newArray addObject:newContact];
    }
    
    return newArray;
    
}


@end

: artist:[thisObject objectForKey:@"artist"] lyrics:[thisObject objectForKey:@"lyrics"] uuid:[thisObject objectForKey:@"uuid"]] rating:[thisObject objectForKey:@"rating"
