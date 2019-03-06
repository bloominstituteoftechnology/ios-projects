//
//  BHContact.h
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BHContact : NSObject

- (instancetype)initWithName: (NSString *)name
                       email:(NSString *)email
                 phoneNumber:(NSString *)phoneNumber;

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *phoneNumber;

@end

NS_ASSUME_NONNULL_END
