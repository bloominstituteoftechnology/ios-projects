//
//  LMSDigitAccumulator.h
//  RPNCalculatorObjC
//
//  Created by Lisa Sampson on 2/28/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMSDigitAccumulator : NSObject

@property (readonly) double value;

- (void)addDigitWithNumericValue: (NSNumber *)number;
- (void)addDecimalPoint;
- (void)clear;

@end

NS_ASSUME_NONNULL_END
