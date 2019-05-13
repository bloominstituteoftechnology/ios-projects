//
//  JKCalculator.h
//  RPNCalculator-ObjC
//
//  Created by TuneUp Shop  on 2/28/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKStack.h"
#import "JKDigitAccumulator.h"



typedef NS_ENUM(NSUInteger, RPNOperator) {
    RPNOperatorAdd,
    RPNOperatorSubtract,
    RPNOperatorMultiply,
    RPNOperatorDivide
};

@interface JKCalculator : NSObject

@property(nonatomic, readonly) id topValue;

- (void)pushNumber:(id)value;

- (void)applyOperator:(RPNOperator)operator;

- (void)clear;

@end


