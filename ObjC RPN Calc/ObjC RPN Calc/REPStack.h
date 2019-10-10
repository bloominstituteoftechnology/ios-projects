//
//  REPStack.h
//  ObjC RPN Calc
//
//  Created by Michael Redig on 10/10/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface REPStack : NSObject

@property NSUInteger stackCount;

- (instancetype)initWithValues:(NSArray*)values;

- (void)pushValue:(NSNumber*)stackItem;
- (NSNumber*)popValue;
- (NSNumber*)peekValue;

@end
