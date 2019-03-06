//
//  ABCContact.m
//  ContactsMRC
//
//  Created by Austin Cole on 3/6/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCContact.h"

@implementation ABCContact

- (void)dealloc
{
    [_name release];
    [_nickName release];
    [_emailAddress release];
    [_phoneNumber release];
    [super dealloc];
}

@end
