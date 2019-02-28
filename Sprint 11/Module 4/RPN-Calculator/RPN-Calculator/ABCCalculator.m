//
//  ABCCalculator.m
//  RPN-Calculator
//
//  Created by Austin Cole on 2/28/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCCalculator.h"
#import "ABCStack.h"

@interface ABCCalculator ()

@property ABCStack *stack;

@end
@implementation ABCCalculator

- (NSNumber *)applyOperator:(Operator)mathOperator {
   
    NSInteger rhs = [[_stack pop] integerValue];
    NSInteger lhs = [[_stack pop] integerValue];
    NSInteger result;
    
    switch (mathOperator) {
        case addNumber:
            result = lhs + rhs;
        case subtractNumber:
            result = lhs - rhs;
        case multiplyNumber:
            result = lhs * rhs;
        case divideNumber:
            result = lhs / rhs;
    }
    return @(result);
}
- (void)pushNumber:(double)value {
    [_stack push:value];
}
- (void)clear {
    [_stack pop];
}

- (NSNumber *)topValue {
    return [_stack peek];
}

@end
