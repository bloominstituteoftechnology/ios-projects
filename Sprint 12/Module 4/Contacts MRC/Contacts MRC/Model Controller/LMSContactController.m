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
        _contacts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createContactWithName:(NSString *)name email:(NSString *)email andPhoneNumber:(NSString *)phoneNumber {
    LMSContact *contact = [[LMSContact alloc] initWithName:name email:email andPhoneNumber:phoneNumber];
    [self.contacts addObject:contact];
}

- (void)updateContact:(LMSContact *)contact withName:(NSString *)name email:(NSString *)email andPhoneNumber:(NSString *)phoneNumber {
    NSInteger index = [[self contacts] indexOfObject:contact];
    [[self.contacts objectAtIndex:index] setName:name];
    [[self.contacts objectAtIndex:index] setEmail:email];
    [[self.contacts objectAtIndex:index] setPhoneNumber:phoneNumber];
}

@end
