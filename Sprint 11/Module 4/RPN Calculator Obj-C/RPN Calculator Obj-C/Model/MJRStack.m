//
//  MJRStack.m
//  RPN Calculator Obj-C
//
//  Created by Moses Robinson on 3/28/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRStack.h"

@interface MJRStack()

@property NSMutableArray *values;

@end

@implementation MJRStack

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self != nil) {
        _values = [array mutableCopy];
    }
    return self;
}

- (void)push:(NSInteger)value
{
    // creating an object out of an NSInterger
    [self.values addObject: @(value)];
}
- (NSNumber *)pop
{
    NSNumber *lastObject = [self.values lastObject];
    [self.values removeLastObject];
    return lastObject;
}
- (NSNumber *)peek
{
    return [self.values lastObject];
}

@end
