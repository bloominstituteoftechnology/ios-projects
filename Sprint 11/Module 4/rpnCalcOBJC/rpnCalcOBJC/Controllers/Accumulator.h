//
//  Accumulator.h
//  rpnCalcOBJC
//
//  Created by Nikita Thomas on 1/24/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Accumulator : NSObject

- (void)addDigitWithNumericValue:(NSInteger)digitValue;
- (void)addDecimalPoint;
- (void)clear;

@property (nonatomic, readonly) double value;


@end

NS_ASSUME_NONNULL_END
