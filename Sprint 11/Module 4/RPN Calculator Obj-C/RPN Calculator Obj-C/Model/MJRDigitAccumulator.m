//
//  MJRDigitAccumulator.m
//  RPN Calculator Obj-C
//
//  Created by Moses Robinson on 3/28/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRDigitAccumulator.h"

@interface MJRDigitAccumulator()

@property NSMutableArray *digits;

@end

@implementation MJRDigitAccumulator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _digits = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addDigitWithNumericValue: (NSInteger)value
{
    if (value < 0 || value > 9) { return; }
    
    NSNumber *digit = [NSNumber numberWithInteger:value];
    NSString *digitString = [NSString stringWithFormat:@"%@",digit];
    [self.digits addObject:digitString];
}

- (void)addDecimalPoint
{
    if ([self.digits containsObject:@"."]) { return; }
    
    [self.digits addObject:@"."];
}

- (void)clear
{
    [self.digits removeAllObjects];
}

- (double)value
{
    NSString *numberString = [self.digits componentsJoinedByString:@""];
    double number = [numberString doubleValue];
    return number;
}

@end
