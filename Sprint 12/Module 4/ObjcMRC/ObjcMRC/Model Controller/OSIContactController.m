//
//  OSISongController.m
//  Sprint11
//
//  Created by Sergey Osipyan on 3/1/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSIContactController.h"
#import "OSIContact.h"


@implementation OSIContactController


- (instancetype)init {
    self = [super init];
    if (self) {
        _contacts = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)createContact:(NSString*)firstName lastName:(NSString*)lastName emailAddress:(NSString*)emailAddress phoneNumber:(NSString *)phoneNumber {
    
    OSIContact *contact = [[OSIContact alloc] initWithName:firstName lastName:lastName emailAddress:emailAddress phoneNumber:phoneNumber];
    [[self contacts] addObject:contact];
}

-(void)updateContact:(OSIContact *)conatct firstName:(NSString*)firstName lastName:(NSString*)lastname emailAddress:(NSString*)emailAddress phoneNumber:(NSString *)phoneNumber {
    
    conatct.lastName = lastname;
    conatct.firstName = firstName;
    conatct.emailAddress = emailAddress;
    conatct.phoneNumber = phoneNumber;
    
}




@end
