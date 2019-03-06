//
//  LMSContactController.m
//  Contacts MRC
//
//  Created by Lisa Sampson on 3/6/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSContactController.h"

@implementation LMSContactController

- (id)init {
    self = [super init];
    if (self != nil) {
        _contacts = [[NSMutableArray<LMSContact *> alloc] init];
    }
    return self;
}

- (void)createContact:(LMSContact *)contact {
    [_contacts addObject:contact];
}

- (void)updateContact:(LMSContact *)contact {
    
}

@end
