//
//  Cache.m
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/4/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "Cache.h"

@interface Cache ()

@property NSMutableDictionary *cache;
@property dispatch_queue_t cacheQueue;

@end

@implementation Cache

- (instancetype)init
{
    self = [super init];
    if (self) {
        dispatch_queue_attr_t serialize = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_USER_INITIATED, -1);
        _cacheQueue = dispatch_queue_create("recordingQueue", serialize);
        _cache = [[NSMutableDictionary alloc] init];
        
    }
    return self;
}

- (void) cache:(id)value forKey:(NSURL *)key {
    dispatch_async(_cacheQueue, ^{
        self->_cache[key] = value;
    });
    
}

- (id)valueForKey:(NSURL *)key {
    __block id value = nil;
    dispatch_sync(_cacheQueue, ^{
        value = self->_cache[key];
    });
    return value;
}

- (void)clear {
    dispatch_async(_cacheQueue, ^{
        [self->_cache removeAllObjects];
    });
}




@end
