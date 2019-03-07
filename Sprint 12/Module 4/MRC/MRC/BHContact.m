//
//  BHContact.m
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHContact.h"

@implementation BHContact


- (instancetype)init{
    self = [super init];
    if (self) {
        _uuid = [[NSUUID UUID] UUIDString];
        _email = @"";
        _name = @"";
        _phoneNumber = @"";
    }
    return self;
}

- (instancetype)initWithName: (NSString *)name
                   email:(NSString *)email
                      phoneNumber:(NSString *)phoneNumber
                        uuid:(NSString *)uuid{
    
    self = [super init];
    if (self){
        _name = name;
        _email = email;
        _phoneNumber = phoneNumber;
        _uuid = [[NSUUID UUID] UUIDString];
    }
    [_name retain];
    [_email retain];
    [_phoneNumber retain];
    [_uuid retain];
    return self;
}

- (void)dealloc {
    [_name release];
    [_email release];
    [_phoneNumber release];
    [_uuid release];
    [super dealloc];
}


@end
