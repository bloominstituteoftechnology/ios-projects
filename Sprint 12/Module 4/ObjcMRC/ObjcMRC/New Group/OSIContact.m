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
    return self;
}

-(void)dealloc{
    [_firstName release];
    [_lastName release];
    [_emailAddress release];
    [_phoneNumber release];
    [super dealloc];
}
@end
