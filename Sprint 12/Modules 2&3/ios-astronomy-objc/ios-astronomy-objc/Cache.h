//
//  Cache.h
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/4/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cache<Value> : NSObject

- (void)cache: (Value)value forKey: (NSURL *)key;
- (Value)valueForKey: (NSURL *)key;
- (void)clear;
@end

NS_ASSUME_NONNULL_END
