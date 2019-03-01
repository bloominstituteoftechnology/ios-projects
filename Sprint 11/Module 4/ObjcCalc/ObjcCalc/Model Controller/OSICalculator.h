//
//  OSICalculator.h
//  ObjcCalc
//
//  Created by Sergey Osipyan on 2/28/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <Foundation/Foundation.h>





NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CalcOperators) {
    
    CalcOperatorsAdd,
    CalcOperatorsSubtract,
    CalcOperatorsMultiply,
    CalcOperatorsDivide
};

@interface OSICalculator : NSObject

- (void)pushNumber:(double)value;
- (void)applyOperator:(NSInteger)operator;
- (void)clear;

@end

NS_ASSUME_NONNULL_END
