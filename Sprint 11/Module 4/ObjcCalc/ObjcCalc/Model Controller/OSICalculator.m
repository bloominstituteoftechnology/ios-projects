//
//  OSICalculator.m
//  ObjcCalc
//
//  Created by Sergey Osipyan on 2/28/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSICalculator.h"
#import "OSIStack.h"

@interface OSICalculator ()
@property OSIStack *osiStack;
@property OSICalcOperators *calcOperator;
@end

@implementation OSICalculator

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _osiStack = [[OSIStack alloc] init];
        
    }
    
    return self;
}
- (double) topValue {
    return [[_osiStack peek] doubleValue];
}

- (void)pushNumber:(double)value {
    NSNumber *number = [NSNumber numberWithDouble:value];
    [_osiStack push:number];
}

- (void)applyOperator:(NSInteger)operator {
    
    double result = 0.0;
    double firstNumber = [[_osiStack pop] doubleValue];
    double secondNumber = [[_osiStack pop] doubleValue];
    
    
   
    
    switch (operator) {
        case OSICalcOperatorsAdd:
            result = firstNumber + secondNumber;
            break;
        case OSICalcOperatorsSubtract:
            result = firstNumber - secondNumber;
            break;
        case OSICalcOperatorsMultiply:
            result = firstNumber * secondNumber;
            break;
        case OSICalcOperatorsDivide:
            result = firstNumber / secondNumber;
            break;
            
    }
    [_osiStack push:[NSNumber numberWithDouble:result]];
    
}

- (void)clear {
    [_osiStack pop];
}



@end
