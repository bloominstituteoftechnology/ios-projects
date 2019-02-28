//
//  LMSStack.m
//  RPNCalculatorObjC
//
//  Created by Lisa Sampson on 2/28/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSStack.h"

@interface LMSStack ()

@property NSMutableArray *values;

@end

@implementation LMSStack

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self != nil) {
        _values = array.mutableCopy;
    }
    return self;
}

- (void)push:(NSNumber *)value {
    [self.values addObject:value];
}

- (NSNumber *)pop {
    NSNumber *last = self.values.lastObject;
    [self.values removeLastObject];
    return last;
}

- (NSNumber *)peek {
    return self.values.lastObject;
}

@end
