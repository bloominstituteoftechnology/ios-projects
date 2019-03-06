//
//  ABCContact.m
//  ContactsMRC
//
//  Created by Austin Cole on 3/6/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCContact.h"

@implementation ABCContact

- (instancetype)initWithName:(NSString *)name withPhoneNumber:(NSNumber *)phone withNickName:(NSString *)nickName withEmailAddress:(NSString *)email {
    self = [super init];
    if (self != nil) {
        _name = name;
        _nickName = nickName;
        _emailAddress = email;
        _phoneNumber = phone;
    }
    return self;
}

@end
