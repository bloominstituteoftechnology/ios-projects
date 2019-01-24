//
//  Accumulator.m
//  rpnCalcOBJC
//
//  Created by Nikita Thomas on 1/24/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "Accumulator.h"


@interface Accumulator ()

@property (nonatomic) NSMutableArray<NSString *> *digits;

@end

@implementation Accumulator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _digits = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)addDigitWithNumericValue:(NSInteger)digitValue
{
    if (digitValue >= 0 && digitValue <= 9) {
        [self.digits addObject:[NSString stringWithFormat:@"%li", (long)digitValue]];
    }
}


- (void)addDecimalPoint
{
    if (![self.digits containsObject:@"."]) {
        [self.digits addObject:@"."];
    }
}

- (void)clear
{
    [self.digits removeAllObjects];
}

- (double)value
{
    NSString *stringValue = [self.digits componentsJoinedByString:@""];
    return stringValue.doubleValue;
}



@end
