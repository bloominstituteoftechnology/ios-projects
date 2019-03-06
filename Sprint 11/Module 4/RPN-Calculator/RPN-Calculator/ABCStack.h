//
//  ABCStack.h
//  RPN-Calculator
//
//  Created by Austin Cole on 2/28/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABCStack : NSObject

//MARK: Methods

- (void)push: (NSInteger)number;
- (NSNumber *)pop;
- (NSNumber *)peek;

- (instancetype)initWithArray: (NSArray *)array;
@end

NS_ASSUME_NONNULL_END
