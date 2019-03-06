//
//  ABCContact.h
//  ContactsMRC
//
//  Created by Austin Cole on 3/6/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABCContact : NSObject

@property NSString *nickName;
@property NSString *name;
@property NSString *emailAddress;
@property NSNumber *phoneNumber;

- (instancetype)initWithName:(NSString *)name withPhoneNumber:(NSNumber *)phone withNickName:(nullable NSString *)nickName withEmailAddress:(nullable NSString *)email;

@end

NS_ASSUME_NONNULL_END
