//
//  ABCContactController.m
//  ContactsMRC
//
//  Created by Austin Cole on 3/6/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCContactController.h"

@implementation ABCContactController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contactsArray = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)createContactWithName:(NSString *)name withPhoneNumber:(NSNumber *)phone withNickName:(NSString *)nickName withEmailAddress:(NSString *)email {
    ABCContact *contact = [self makeAndReturnContactWithName:name withPhoneNumber:phone withNickName:nickName withEmailAddress:email];
    [_contactsArray addObject:contact];
    
}
- (void)editContact:(ABCContact *)contact withName:(NSString *)name withPhoneNumber:(NSNumber *)phone withNickName:(NSString *)nickName withEmailAddress:(NSString *)email{
    NSInteger index = [_contactsArray indexOfObject:contact];
    [_contactsArray removeObject:contact];
    contact.nickName = nickName;
    contact.name = name;
    contact.phoneNumber = phone;
    contact.emailAddress = email;
    [_contactsArray insertObject:contact atIndex:index];
    
}
- (ABCContact *)makeAndReturnContactWithName:(NSString *)name withPhoneNumber:(NSNumber *)phone withNickName:(nullable NSString *)nickName withEmailAddress:(nullable NSString *)email {
    ABCContact *newContact = [[ABCContact alloc] init];
    newContact.name = name;
    newContact.nickName = nickName;
    newContact.phoneNumber = phone;
    newContact.emailAddress = email;
    [newContact autorelease];
    return newContact;
}

- (void)dealloc
{
    [_contactsArray dealloc];
    [super dealloc];
}


@end
