//
//  BHContact.m
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHContact.h"

@implementation BHContact

- (instancetype)initWithName: (NSString *)name
                   email:(NSString *)email
                      phoneNumber:(NSString *)phoneNumber{
    
    self = [super init];
    if (self){
        _name = name;
        _email = email;
        _phoneNumber = phoneNumber;
    }
    return self;
}


@end
