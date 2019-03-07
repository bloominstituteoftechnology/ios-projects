//
//  LMSDigitAccumulator.m
//  RPNCalculatorObjC
//
//  Created by Lisa Sampson on 2/28/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSDigitAccumulator.h"

@interface LMSDigitAccumulator ()

@property NSMutableArray *digits;

@end

@implementation LMSDigitAccumulator

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _digits = [NSMutableArray arrayWithArray:@[]];
    }
    return self;
}

- (double)value {
    NSString *numberAsString = [self.digits componentsJoinedByString:@""];
    double number = numberAsString.doubleValue;
    return number;
}

- (void)addDigitWithNumericValue: (NSInteger)number {
    NSNumber *digit = [NSNumber numberWithInteger:number];
    NSString *string = digit.stringValue;
    [self.digits addObject:string];
}

- (void)addDecimalPoint {
    [self.digits addObject:@"."];
}

- (void)clear {
    [self.digits removeAllObjects];
}

@end
