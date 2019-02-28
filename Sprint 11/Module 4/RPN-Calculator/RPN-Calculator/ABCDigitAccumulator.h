//
//  ABCDigitAccumulator.h
//  RPN-Calculator
//
//  Created by Austin Cole on 2/28/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABCDigitAccumulator : NSObject

//MARK: Methods
- (void)addDigitWithNumericValue: (NSInteger)number;
- (void)AddDecimalPoint;
- (void)clear;

//MARK: Properties
@property(readonly) double value;

@end

NS_ASSUME_NONNULL_END
