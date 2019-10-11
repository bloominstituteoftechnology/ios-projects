//
//  REPDigitAccumulator.m
//  ObjC RPN Calc
//
//  Created by Michael Redig on 10/10/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPDigitAccumulator.h"

@interface REPDigitAccumulator()

@property NSMutableString* digits;

@end

@implementation REPDigitAccumulator

- (double)value {
	return [self.digits doubleValue];
}

- (NSString *)stringValue {
	return [NSString stringWithFormat:@"%@", self.digits];
}

- (instancetype)init {
	if (self = [super init]) {
		_digits = [NSMutableString string];
	}
	return self;
}

- (void)addDecimalPoint {
	if ([self.digits containsString:@"."]) {
		return;
	}
	[self.digits appendString:@"."];
}

- (void)addDigitWithNumericValue:(int)value {
	if (value > 9 && value < 0) {
		return;
	}

	[self.digits appendFormat:@"%i", value];
}

- (void)clear {
	self.digits = [@"" mutableCopy];
}

@end
