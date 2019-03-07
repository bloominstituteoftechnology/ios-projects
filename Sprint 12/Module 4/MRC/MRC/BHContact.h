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
                 phoneNumber:(NSString *)phoneNumber
                        uuid:(NSString *)uuid;

@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSString *email;
@property (retain, nonatomic) NSString *phoneNumber;
@property (retain, nonatomic) NSString *uuid;

@end

NS_ASSUME_NONNULL_END
