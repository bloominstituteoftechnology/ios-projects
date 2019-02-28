//
//  BHStack.m
//  NSCalculator
//
//  Created by Benjamin Hakes on 2/28/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHStack.h"

@interface BHStack ()

@property NSMutableArray *values;

@end

@implementation BHStack

-(instancetype)initWith: (NSArray *)array{
    self = [super init];
    if (self) {
        _values = [array mutableCopy];
   
    }
    return self;
}

-(void)push: (NSNumber *)number{
    [_values addObject: number];
}

-(NSNumber *)pop{
    NSNumber *numberToReturn = [_values lastObject];
    [_values removeLastObject];
    return numberToReturn;
    
}

-(NSNumber *)peak{
    return [_values lastObject];
}


@end
