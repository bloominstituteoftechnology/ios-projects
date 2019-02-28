//
//  LMSCalculator.m
//  RPNCalculatorObjC
//
//  Created by Lisa Sampson on 2/28/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSCalculator.h"
#import "LMSStack.h"

@interface LMSCalculator ()

@property LMSStack *stack;

@end

@implementation LMSCalculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _stack = [[LMSStack alloc] initWithArray:@[@0.0, @0.0]];
    }
    return self;
}

- (NSNumber *)topValue {
    return [self.stack peek];
}

- (void)pushNumber:(double)value {
    NSNumber *number = [NSNumber numberWithDouble:value];
    [self.stack push:number];
}
- (void)applyCalculatorOperator:(LMSCalculatorOperator)calculatorOperator {
    
    double operand2 = [[self.stack pop] doubleValue];
    double operand1 = [[self.stack pop] doubleValue];
    
    double result = 0.0;
    switch (calculatorOperator) {
        case LMSCalculatorOperatorAdd:
            result = operand1 + operand2;
            break;
        case LMSCalculatorOperatorSubtract:
            result = operand1 - operand2;
            break;
        case LMSCalculatorOperatorMultiply:
            result = operand1 * operand2;
            break;
        case LMSCalculatorOperatorDivide:
            result = operand1 / operand2;
            break;
    }
    [self.stack push:[NSNumber numberWithDouble:result]];
}
- (void)clear {
    self.stack = [[LMSStack alloc] initWithArray:@[@0.0, @0.0]];
}

@end
