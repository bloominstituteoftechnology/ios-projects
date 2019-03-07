//
//  LMSContact.m
//  Contacts MRC
//
//  Created by Lisa Sampson on 3/6/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSContact.h"

@implementation LMSContact

- (instancetype)initWithName:(NSString *)name email:(NSString *)email andPhoneNumber:(NSString *)phoneNumber {
    self = [super init];
    
    if (self != nil) {
        _name = name;
        _email = email;
        _phoneNumber = phoneNumber;
    }
    return self;
}

@end
