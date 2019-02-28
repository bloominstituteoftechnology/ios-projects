//
//  LMSStack.h
//  RPNCalculatorObjC
//
//  Created by Lisa Sampson on 2/28/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMSStack : NSObject

- (instancetype)initWithArray: (NSArray *)array;

- (void)push: (NSNumber *)value;
- (NSNumber *)pop;
- (NSNumber *)peek;

@end

NS_ASSUME_NONNULL_END
