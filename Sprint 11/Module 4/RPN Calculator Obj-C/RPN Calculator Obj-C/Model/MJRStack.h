//
//  MJRStack.h
//  RPN Calculator Obj-C
//
//  Created by Moses Robinson on 3/28/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJRStack : NSObject

- (void)push: (NSInteger)value;
- (NSNumber *)pop;
- (NSNumber *)peek;

- (instancetype)initWithArray: (NSArray *)array;

@end

NS_ASSUME_NONNULL_END
