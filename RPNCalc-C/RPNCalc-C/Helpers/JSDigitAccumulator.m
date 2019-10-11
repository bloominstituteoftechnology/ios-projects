//
//  JSDigitAccumulator.m
//  RPNCalc-C
//
//  Created by Jeffrey Santana on 10/10/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import "JSDigitAccumulator.h"

@interface JSDigitAccumulator ()

@property NSMutableArray *digits;

@end

@implementation JSDigitAccumulator

- (double)value {
	return [self.stringValue doubleValue];
};

- (NSString *)stringValue {
	return [self.digits componentsJoinedByString:@""];
}

- (void)addDigitWithNumericValue:(NSInteger)value {
	if (value < 0 || value > 9) {
		NSString *digit = [NSString stringWithFormat:@"%li", (long)value];
		[self.digits addObject:digit];
	}
}

- (void)addDecimalPoint {
	if (![self.digits containsObject:@"."]) {
		[self.digits addObject:@"."];
	}
}

- (void)clear {
	[self.digits removeAllObjects];
}

@end
