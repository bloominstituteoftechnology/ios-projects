//
//  BHStack.h
//  NSCalculator
//
//  Created by Benjamin Hakes on 2/28/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BHStack : NSObject

-(instancetype)initWith: (NSArray *)array;

-(void)push: (NSNumber *)number;

-(NSNumber *)pop;

-(NSNumber *)peak;

@end

NS_ASSUME_NONNULL_END
