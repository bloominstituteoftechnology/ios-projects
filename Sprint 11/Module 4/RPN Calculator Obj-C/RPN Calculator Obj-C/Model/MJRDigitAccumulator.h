//
//  MJRDigitAccumulator.h
//  RPN Calculator Obj-C
//
//  Created by Moses Robinson on 3/28/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJRDigitAccumulator : NSObject

- (void)addDigitWithNumericValue: (NSInteger)value;
- (void)addDecimalPoint;
- (void)clear;

@property (readonly) double value;

@end

NS_ASSUME_NONNULL_END
