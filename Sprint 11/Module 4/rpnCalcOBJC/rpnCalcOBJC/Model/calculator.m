//
//  calculator.m
//  rpnCalcOBJC
//
//  Created by Nikita Thomas on 1/24/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "calculator.h"
#import "Stack.h"

@interface calculator ()

@property Stack *stack;

@end


@implementation calculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _stack = [[Stack alloc] initWithArray:@[@0.0, @0.0]];
    }
    return self;
}

- (void)pushNumber:(double)value
{
    [self.stack push:value];
}

- (void)applyOperator:(OperatorType)_operator
{
    double a = [self.stack pop];
    double b = [self.stack pop];
    double result;
    
    switch (_operator) {
        case Add:
            result = a + b;
        case Subtract:
            result = a - b;
        case Multiply:
            result = a * b;
        case Divide:
            result = a / b;
    }
    
    [self.stack push:result];
}

- (void)clear
{
    self.stack = [[Stack alloc] initWithArray:@[@0.0, @0.0]];
}

- (double)topValue
{
    return [self.stack peek];
}




@end
