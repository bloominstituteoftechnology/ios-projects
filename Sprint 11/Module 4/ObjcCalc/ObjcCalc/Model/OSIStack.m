//
//  OSIStack.m
//  ObjcCalc
//
//  Created by Sergey Osipyan on 2/28/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSIStack.h"

@interface OSIStack ()

@property NSMutableArray *values;

@end

@implementation OSIStack

- (instancetype)initWithArray:(NSArray *)array {
    
    self = [super init];
    if (self) {
        _values = [array mutableCopy];
    }
    return self;
}

- (void)push:(NSNumber *)number {
    [_values addObject:number];
}

- (NSNumber *)pop {
    NSNumber *returnLastNumber = [_values lastObject];
    [_values removeLastObject];
    return returnLastNumber;
}

- (NSNumber *)peek {
    return [_values lastObject];
}




@end
