//
//  OSISong.m
//  Sprint11
//
//  Created by Sergey Osipyan on 3/1/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSIContact.h"

@implementation OSIContact

- (instancetype)initWithName:(NSString *)firstName lastName:(NSString *)lastName emailAddress:(NSString *)emailAddress phoneNumber:(NSString *)phoneNumber {
    
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _emailAddress = emailAddress;
        _phoneNumber = phoneNumber;
        
    }
    [self autorelease];
    return self;
}

@end
