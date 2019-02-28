//
//  LMSCalculator.h
//  RPNCalculatorObjC
//
//  Created by Lisa Sampson on 2/28/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMSCalculator : NSObject

typedef NS_ENUM(NSInteger, LMSCalculatorOperator) {
    LMSCalculatorOperatorAdd,
    LMSCalculatorOperatorSubtract,
    LMSCalculatorOperatorMultiply,
    LMSCalculatorOperatorDivide
};

@property (readonly) NSNumber *topValue;

- (void)pushNumber:(double)value;
- (void)applyCalculatorOperator:(LMSCalculatorOperator)calculatorOperator;
- (void)clear;
@end

NS_ASSUME_NONNULL_END
