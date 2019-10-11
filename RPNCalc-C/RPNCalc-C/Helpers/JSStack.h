//
//  JSStack.h
//  RPNCalc-C
//
//  Created by Jeffrey Santana on 10/10/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSStack : NSObject

-(instancetype)initWithArray:(NSArray *)array;

@property (assign, nonatomic) int count;

-(void)push:(double)value;
-(double)pop;
-(double)peek;

@end

NS_ASSUME_NONNULL_END
