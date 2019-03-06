//
//  ABCStack.m
//  RPN-Calculator
//
//  Created by Austin Cole on 2/28/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCStack.h"

@interface ABCStack ()

//MARK: Private Properties
@property NSMutableArray *values;

@end

@implementation ABCStack

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self != nil) {
        _values = [array mutableCopy];
    }
    return self;
}

//MARK: Methods
- (void)push:(NSInteger)number {
    //When I put number inside of a pair of parentheses with an `@` symbol right before the open parenteses, it turns what is in this case an NSInteger into an NSNumber so that it can be stored inside of the array
    [_values addObject: @(number)];
}
- (NSNumber *)pop{
    NSNumber *lastobject = [_values lastObject];
    [_values removeLastObject];
    return lastobject;
}
- (NSNumber *)peek {
    return [_values lastObject];
}

@end
