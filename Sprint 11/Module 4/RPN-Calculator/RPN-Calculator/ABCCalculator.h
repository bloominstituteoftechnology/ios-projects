//
//  ABCCalculator.h
//  RPN-Calculator
//
//  Created by Austin Cole on 2/28/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABCCalculator : NSObject


typedef enum : NSUInteger {
    addNumber,
    subtractNumber,
    multiplyNumber,
    divideNumber,
} Operator;

//MARK: Methods
- (void)pushNumber: (double)value;
- (NSNumber *)applyOperator: (Operator)mathOperator;
- (void)clear;

//MARK: Properties
@property(nonatomic) NSNumber *topValue;

@end

NS_ASSUME_NONNULL_END
