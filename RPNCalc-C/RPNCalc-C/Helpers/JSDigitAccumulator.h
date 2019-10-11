//
//  JSDigitAccumulator.h
//  RPNCalc-C
//
//  Created by Jeffrey Santana on 10/10/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSDigitAccumulator : NSObject

@property (assign, nonatomic) double value;
@property (assign, nonatomic) NSString *stringValue;

- (void)addDigitWithNumericValue:(NSInteger)value;
- (void)addDecimalPoint;
- (void)clear;

@end

NS_ASSUME_NONNULL_END
