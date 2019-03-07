//
//  OSIDigitAccumulator.m
//  ObjcCalc
//
//  Created by Sergey Osipyan on 2/28/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSIDigitAccumulator.h"

@interface OSIDigitAccumulator ()
@property NSMutableArray *digits;
@end


@implementation OSIDigitAccumulator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _digits = [NSMutableArray arrayWithArray:@[]];
    }
    return self;
}

- (double)value {
    NSString *numberAsString = [_digits componentsJoinedByString:@""];
    double number = numberAsString.doubleValue;
    return number;
}

- (void)addDigitWithNumericValue: (NSInteger)number {
    
    NSNumber *digit = [NSNumber numberWithInteger:number];
    NSString *digitString = digit.stringValue;
    [_digits addObject:digitString];
}

- (void)addDecimalPoint {
    if ([_digits containsObject:@"."]) {
        NSLog(@"Try to add more then one DecimalPoint");
    } else {
        [_digits addObject:@"."];
    }
}

- (void)clear {
    [_digits removeAllObjects];
}

@end
