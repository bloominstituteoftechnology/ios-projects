//
//  JSStack.m
//  RPNCalc-C
//
//  Created by Jeffrey Santana on 10/10/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import "JSStack.h"

@interface JSStack ()

@property NSMutableArray *values;

@end

@implementation JSStack

- (int)count {
	return (int)self.values.count;
}

- (instancetype)initWithArray:(NSArray *)array {
	self = [super init];
	if (self) {
		[_values addObjectsFromArray:array];
	}
	return self;
}

- (void)push:(double)value {
	[self.values addObject:[NSNumber numberWithDouble:value]];
}

- (double)pop {
	double value = [self.values.lastObject doubleValue];
	[self.values removeLastObject];
	
	return value;
}

- (double)peek {
	return [self.values.lastObject doubleValue];
}

@end
