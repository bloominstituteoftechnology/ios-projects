//
//  JKCalculator.m
//  RPNCalculator-ObjC
//
//  Created by TuneUp Shop  on 2/28/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKCalculator.h"
#import "JKStack.h"
#import "JKDigitAccumulator.h"

@interface JKCalculator ()

@property JKStack *stack;

@end

@implementation JKCalculator



- (void)pushNumber:(id)value {
    [_stack pushValue:value];
}

- (void)applyOperator:(RPNOperator)operator {
    
}

- (void)clear {
    
}

- (id)getTopValue {
    return [_stack peekValue];
}

@end
