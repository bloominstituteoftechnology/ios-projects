//
//  JSCalculator.m
//  RPNCalc-C
//
//  Created by Jeffrey Santana on 10/10/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import "JSCalculator.h"
#import "JSStack.h"

@interface JSCalculator ()

@property JSStack *stack;

@end

@implementation JSCalculator

- (void)pushNumber:(double)value {
	[self.stack push:value];
}

- (void)applyOperator:(CalcOperation)operator {
	double result = 0;	
	
//	if ([self.stack count] > 2) {
	double rhsOperand = [self.stack pop];
	double lhsOperand = [self.stack pop];
	if (rhsOperand || lhsOperand) {
		switch (operator) {
			case add:
				result = lhsOperand + rhsOperand;
				break;
			case subtract:
				result = lhsOperand - rhsOperand;
				break;
			case multiply:
				result = lhsOperand * rhsOperand;
				break;
			case divide:
				result = lhsOperand / rhsOperand;
				break;
		}
		
		[self.stack push:result];
	}
//	}
}

- (void)clear {
	self.stack = [[JSStack alloc] init];
}

@end
