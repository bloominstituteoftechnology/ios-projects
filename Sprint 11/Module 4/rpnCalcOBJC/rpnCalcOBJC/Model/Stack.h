//
//  Stack.h
//  rpnCalcOBJC
//
//  Created by Nikita Thomas on 1/24/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stack : NSObject


- (instancetype)initWithArray:(NSArray *)array;


- (void)push:(double)number;

- (double)pop;

- (double)peek;

@end

NS_ASSUME_NONNULL_END
