//
//  ABCDigitAccumulator.m
//  RPN-Calculator
//
//  Created by Austin Cole on 2/28/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCDigitAccumulator.h"
#import "ABCCalculator.h"

@interface ABCDigitAccumulator ()

@property NSMutableArray *digits;

@end

@implementation ABCDigitAccumulator

- (void)AddDecimalPoint {
    [_digits addObject:@"."];
}
- (void)addDigitWithNumericValue: (NSInteger)number {
    [_digits addObject: @(number)];
}
- (void)clear {
    [_digits removeAllObjects];
}
- (double)value {
    NSMutableArray *stringArray;
    for (NSInteger index = 0; index < [_digits count]; index++) {
        if (![[_digits objectAtIndex:index]  isEqual: @"."]) {
        NSString *stringifiedDigit = [[_digits objectAtIndex:index] string];
        [stringArray addObject:stringifiedDigit];
        }
        else {
            [stringArray addObject: @"."];
        }
    }
    NSString *digitString = [stringArray componentsJoinedByString:@""];
    
    return [digitString doubleValue];
    
}

@end
