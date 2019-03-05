//
//  NASAMarsPhotosNetworkingClient.h
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/4/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ios_astronomy_objc-Swift.h"


NS_ASSUME_NONNULL_BEGIN

@interface NASAMarsPhotosNetworkingClient : NSObject

- (void)fetchPhotosWithRover:(NSString *)rover withSol:(NSInteger)sol completion:(void (^)(NSError * _Nonnull))completionHandler;

@property NSArray *imageURLS;


@end

NS_ASSUME_NONNULL_END
