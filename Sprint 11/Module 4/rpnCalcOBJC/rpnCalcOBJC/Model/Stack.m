//
//  Stack.m
//  rpnCalcOBJC
//
//  Created by Nikita Thomas on 1/24/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@property (nonatomic) NSMutableArray *values;

@end

@implementation Stack

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        _values = [array mutableCopy];
    }
    return self;
}

- (void)push:(double)number
{
    [self.values addObject:@(number)];
}

- (double)pop
{
    NSNumber *lastNumber = self.values.lastObject;
    [self.values removeLastObject];
    return lastNumber.doubleValue;
}

- (double)peek
{
    return [self.values.lastObject doubleValue];
}


@end
