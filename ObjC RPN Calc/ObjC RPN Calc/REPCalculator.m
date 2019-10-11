//
//  REPCalculator.m
//  ObjC RPN Calc
//
//  Created by Michael Redig on 10/10/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPCalculator.h"
#import "REPStack.h"

@interface REPCalculator()

@property REPStack *stack;

@end

@implementation REPCalculator

- (NSNumber *)topValue {
	return self.stack.peekValue;
}

- (instancetype)init {
	if (self = [super init]) {
		_stack = [[REPStack alloc] init];
	}
	return self;
}

- (void)pushNumber:(double)value {
	NSNumber* number = [NSNumber numberWithDouble:value];
	[self.stack pushValue:number];
}

- (void)applyOperator:(REPCalculatorOperation)operator {
	if (self.stack.stackCount < 2) {
		return;
	}

	NSNumber* operator1 = [self.stack popValue];
	NSNumber* operator2 = [self.stack popValue];
	double value1 = [operator1 doubleValue];
	double value2 = [operator2 doubleValue];

	double result;
	switch (operator) {
		case add:
			result = value1 + value2;
			break;
		case subtract:
			result = value2 - value1;
			break;
		case multiply:
			result = value1 * value2;
			break;
		case divide:
			if (value1 == 0) {
				result = NAN;
			}
			result = value2 / value1;
		default:
			break;
	}

	NSNumber *resultNumber = [NSNumber numberWithDouble:result];
	[self.stack pushValue:resultNumber];
}

- (void)clear {
	self.stack = [[REPStack alloc] init];
}

@end
