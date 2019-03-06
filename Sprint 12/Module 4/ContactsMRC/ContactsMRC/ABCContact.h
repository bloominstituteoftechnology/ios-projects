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

@property(retain) NSString *nickName;
@property(retain) NSString *name;
@property(retain) NSString *emailAddress;
@property(retain) NSNumber *phoneNumber;



@end

NS_ASSUME_NONNULL_END
