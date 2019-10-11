//
//  JSCalculator.h
//  RPNCalc-C
//
//  Created by Jeffrey Santana on 10/10/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSCalculator : NSObject

typedef NS_ENUM(NSInteger, CalcOperation) {
	add,
	subtract,
	multiply,
	divide
};

@property (assign, nonatomic) int topValue;

- (void)pushNumber:(double)value;
- (void)applyOperator:(CalcOperation)operator;
- (void)clear;

@end
