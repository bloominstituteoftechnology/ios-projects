//
//  MJRCalculator.h
//  RPN Calculator Obj-C
//
//  Created by Moses Robinson on 3/28/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJRCalculator : NSObject

typedef NS_ENUM(NSInteger, Operator) {
    add,
    subtract,
    multiply,
    divide
};

- (void)pushNumber: (double)value;
- (void)applyOperator: (Operator)calculatorOperator;
- (void)clear;

@property (nonatomic) NSNumber *topValue;

@end

NS_ASSUME_NONNULL_END
