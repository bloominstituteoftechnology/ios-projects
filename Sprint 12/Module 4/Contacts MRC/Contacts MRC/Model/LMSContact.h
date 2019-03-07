//
//  LMSContact.h
//  Contacts MRC
//
//  Created by Lisa Sampson on 3/6/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMSContact : NSObject

@property NSString *name;
@property NSString *email;
@property NSString *phoneNumber;

- (instancetype)initWithName: (NSString *)name email: (NSString *)email andPhoneNumber: (NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END
