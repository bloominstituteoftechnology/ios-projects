//
//  OSIStack.h
//  ObjcCalc
//
//  Created by Sergey Osipyan on 2/28/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSIStack : NSObject

- (void)push:(NSArray *)value;
- (void)pop:(NSArray *)value;
- (void)peek:(NSArray *)value;

-(instancetype)initWithArray: (NSArray *)array;

@end

NS_ASSUME_NONNULL_END
