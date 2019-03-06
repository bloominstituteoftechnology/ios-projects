//
//  LMSContactController.m
//  Contacts MRC
//
//  Created by Lisa Sampson on 3/6/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSContactController.h"

@implementation LMSContactController

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _contacts = [[NSMutableArray<LMSContact *> alloc] init];
    }
    return self;
}

- (void)createContactWithName:(NSString *)name email:(NSString *)email andPhoneNumber:(NSString *)phoneNumber {
    LMSContact *contact = [[LMSContact alloc] initWithName:name email:email andPhoneNumber:phoneNumber];
    [_contacts addObject:contact];
}

- (void)updateContact:(LMSContact *)contact withName:(NSString *)name email:(NSString *)email andPhoneNumber:(NSString *)phoneNumber {
    NSInteger index = [_contacts indexOfObject:contact];
    [_contacts removeObjectAtIndex:index];
    contact.name = name;
    contact.email = email;
    contact.phoneNumber = phoneNumber;
    [_contacts insertObject:contact atIndex:index];
}

@end
