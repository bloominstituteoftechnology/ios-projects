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

- (instancetype)init
{
    self = [super init];
    if (self) {
        _digits = [NSMutableArray new];
    }
    return self;
}

- (void)addDecimalPoint {
    [_digits addObject:@"."];
}
- (void)addDigitWithNumericValue: (NSInteger)number {
    [_digits addObject: @(number)];
}
- (void)clear {
    [_digits removeAllObjects];
}
- (double)value {
    NSMutableArray *stringArray = [NSMutableArray new];
    for (NSInteger index = 0; index < [_digits count]; index++) {
        if (![[_digits objectAtIndex:index]  isEqual: @"."]) {
            NSNumber *digit = [_digits objectAtIndex:index];
        NSString *stringifiedDigit = [digit stringValue];
        [stringArray addObject:stringifiedDigit];
        }
        else {
            [stringArray addObject: @"."];
        }
    }
    return [[stringArray componentsJoinedByString:@""] doubleValue];
    
}

@end
