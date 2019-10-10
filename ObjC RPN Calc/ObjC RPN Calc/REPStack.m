//
//  REPStack.m
//  ObjC RPN Calc
//
//  Created by Michael Redig on 10/10/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPStack.h"

@interface REPStack()

@property NSMutableArray* values;

@end

@implementation REPStack

- (instancetype)init {
	if (self = [super init]) {
		_values = [NSMutableArray array];
	}
	return self;
}

- (instancetype)initWithValues:(NSArray*)values {
	if (self = [super init]) {
		_values = [values mutableCopy];
	}
	return self;
}

- (void)pushValue:(NSNumber *)stackItem {
	[self.values addObject:stackItem];
}

- (NSNumber *)popValue {
	NSNumber* num = [self.values lastObject];
	[self.values removeLastObject];
	return num;
}

- (NSNumber *)peekValue {
	return [self.values lastObject];
}


@end
