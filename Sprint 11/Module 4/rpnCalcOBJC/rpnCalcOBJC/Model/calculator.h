//
//  calculator.h
//  rpnCalcOBJC
//
//  Created by Nikita Thomas on 1/24/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface calculator : NSObject

typedef NS_ENUM(NSInteger, OperatorType) {
    Add,
    Subtract,
    Multiply,
    Divide
};

- (void)pushNumber:(double)value;

- (void)applyOperator:(OperatorType)_operator;

- (void)clear;

@property (nonatomic) double topValue;

@end

NS_ASSUME_NONNULL_END
