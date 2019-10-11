//
//  REPDigitAccumulator.h
//  ObjC RPN Calc
//
//  Created by Michael Redig on 10/10/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface REPDigitAccumulator : NSObject

@property (readonly) double value;
@property (readonly) NSString* stringValue;

- (void)addDigitWithNumericValue:(int)value;
- (void)addDecimalPoint;
- (void)clear;

@end
