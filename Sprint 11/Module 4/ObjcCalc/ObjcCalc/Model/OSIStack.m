//
//  OSIStack.m
//  ObjcCalc
//
//  Created by Sergey Osipyan on 2/28/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSIStack.h"

@interface OSIDocument : NSObject

@property NSMutableArray *values;

@end

@implementation OSIStack



- (void)pop:(NSNumber *)number {
    [[number mutableCopy] values];
}

- (void)push:(NSArray *)value {
    NSMutableArray *a = ;
}

- (void)peek:(NSArray *)value {
    
}

- (instancetype)initWithArray:(NSArray *)array {
    
    [[array mutableCopy] values];
    
    return self;
}

@end
