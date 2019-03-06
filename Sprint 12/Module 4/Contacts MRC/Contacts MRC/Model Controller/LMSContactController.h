//
//  LMSContactController.h
//  Contacts MRC
//
//  Created by Lisa Sampson on 3/6/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMSContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface LMSContactController : NSObject

@property NSMutableArray<LMSContact *> *contacts;

- (void)createContactWithName: (NSString *)name email: (NSString *)email andPhoneNumber: (NSString *)phoneNumber;
- (void)updateContact: (LMSContact *)contact withName: (NSString *)name email: (NSString *)email andPhoneNumber: (NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END
