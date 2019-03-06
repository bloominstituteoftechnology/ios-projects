//
//  ABCContactController.h
//  ContactsMRC
//
//  Created by Austin Cole on 3/6/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABCContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ABCContactController : NSObject

@property(retain) NSMutableArray *contactsArray;

- (ABCContact *)makeAndReturnContactWithName:(NSString *)name withPhoneNumber:(NSNumber *)phone withNickName:(nullable NSString *)nickName withEmailAddress:(nullable NSString *)email;

- (void)createContactWithName:(NSString *)name withPhoneNumber:(NSNumber *)phone withNickName:(nullable NSString *)nickName withEmailAddress:(nullable NSString *)email;

- (void)editContact:(ABCContact *)contact withName:(NSString *)name withPhoneNumber:(NSNumber *)phone withNickName:(NSString *)nickName withEmailAddress:(NSString *)email;

@end

NS_ASSUME_NONNULL_END
