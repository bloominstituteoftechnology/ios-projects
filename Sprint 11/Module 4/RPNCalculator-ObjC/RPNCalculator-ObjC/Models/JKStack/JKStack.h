//
//  JKStack.h
//  RPNCalculator-ObjC
//
//  Created by TuneUp Shop  on 2/28/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JKStack : NSObject

- (instancetype)initWithArray:(NSArray *)array;

- (void)pushValue:(id)value;

- (instancetype)popValue;

- (instancetype)peekValue;

@end


