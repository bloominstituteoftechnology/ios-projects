//
//  JKContactsController.m
//  ContactsMRC
//
//  Created by TuneUp Shop  on 3/7/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKContactsController.h"

@implementation JKContactsController {
    NSMutableArray *_savedContacts;
}

- (instancetype)init
{
    self = [super init];
    if (self != nil){
        @autoreleasepool {
            _savedContacts = [[NSMutableArray array] retain];
        }
        
        
    }
    return self;
}

- (void)saveContactWithName:(NSString *)name email:(NSString *)phone email:(NSString *)email {
    JKContact *contact = [[JKContact alloc]initWithName:name email:email phone:phone];
    [_savedContacts addObject:contact];
}



@end
