//
//  JKContactsController.m
//  ContactsMRC
//
//  Created by TuneUp Shop  on 3/7/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKContactsController.h"

@implementation JKContactsController

+ (id)sharedController {
    static JKContactsController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[self alloc] init];
    });
    return sharedController;
}

- (id)init {
    if (self = [super init]) {
        _savedContacts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self != nil){
//        @autoreleasepool {
//            _savedContacts = [[NSMutableArray array] retain];
//        }
//
//
//    }
//    return self;
//}

//- (void)saveContactWithName:(NSString *)name email:(NSString *)phone email:(NSString *)email {
//    JKContact *contact = [[JKContact alloc]initWithName:name email:email phone:phone];
//    [_savedContacts addObject:contact];
//}



@end
