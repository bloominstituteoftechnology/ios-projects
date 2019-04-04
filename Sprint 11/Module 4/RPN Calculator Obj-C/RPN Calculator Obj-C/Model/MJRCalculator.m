//
//  MJRCalculator.m
//  RPN Calculator Obj-C
//
//  Created by Moses Robinson on 3/28/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRCalculator.h"
#import "MJRStack.h"

@interface MJRCalculator()

@property MJRStack *stack;

@end

@implementation MJRCalculator

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        _stack = [[MJRStack alloc] initWithArray:@[@0.0, @0.0]];
    }
    return self;
}

- (void)pushNumber: (double)value
{
    [self.stack push:value];
}

- (void)applyOperator: (Operator)calculatorOperator
{
    NSInteger number1 = [[self.stack pop] doubleValue];
    NSInteger number2 = [[self.stack pop] doubleValue];
    
    NSInteger result;
    
    switch (calculatorOperator) {
        case add:
            result = number1 + number2;
            break;
        case subtract:
            result = number1 - number2;
            break;
        case multiply:
            result = number1 * number2;
            break;
        case divide:
            result = number1 / number2;
            break;
    }
    
    [self.stack push:result];
}

- (void)clear
{
    self.stack = [[MJRStack alloc] initWithArray:@[@0.0, @0.0]];
}

- (NSNumber *)topValue {
    return [self.stack peek];
}

@end
