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

- (void)clear {
    [_stack emptyStack];
}

- (id)getTopValue {
    return [_stack peekValue];
}

- (void)applyOperator:(RPNOperator)operator {
    
    id rhs = [_stack popValue];
    id lhs = [_stack popValue];
    
    id result;
    switch (operator) {
    
    
        case RPNOperatorAdd:
            result = lhs + rhs;
            break;
        case RPNOperatorSubtract:
            <#code#>
            break;
        case RPNOperatorMultiply:
            <#code#>
            break;
        case RPNOperatorDivide:
            <#code#>
            break;
    }
}

@end
