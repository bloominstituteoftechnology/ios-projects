//
//  JKStack.m
//  RPNCalculator-ObjC
//
//  Created by TuneUp Shop  on 2/28/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKStack.h"

@interface JKStack ()
@property (nonatomic, strong) NSMutableArray *values;
@end

@implementation JKStack

@synthesize values = _values;

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self != nil) {
        _values = [[NSMutableArray alloc] initWithArray:array];
    }
    return self;
}

- (void)pushValue:(id)value {
    if (value != nil) {
        [_values addObject:value];
    }
}

- (instancetype)popValue {
    if (_values.count > 0) {
        id value = [_values objectAtIndex:(_values.count - 1)];
        [_values removeLastObject];
        return value;
    }
    return nil;
}

- (instancetype)peekValue {
    if (_values.count > 0) {
        id value = [_values objectAtIndex:(_values.count - 1)];
        return value;
    }
    return nil;
}

- (void)emptyStack {
    if (_values.count > 0) {
        [_values removeAllObjects];
    }
}

@end
