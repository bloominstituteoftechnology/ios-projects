//
//  REPCalculator.h
//  ObjC RPN Calc
//
//  Created by Michael Redig on 10/10/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface REPCalculator : NSObject

typedef NS_ENUM(int, REPCalculatorOperation) {
	add, subtract, divide, multiply
};

@property (readonly) NSNumber* topValue;

- (void)pushNumber:(double)value;
- (void)applyOperator:(REPCalculatorOperation)operator;
- (void)clear;

@end
