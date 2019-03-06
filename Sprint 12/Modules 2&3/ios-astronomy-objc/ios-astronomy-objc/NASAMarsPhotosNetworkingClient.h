//
//  NASAMarsPhotosNetworkingClient.h
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/4/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@class MarsPhotoReference;

@interface NASAMarsPhotosNetworkingClient : NSObject

- (void)fetchPhotosWithRover:(NSString *)rover completion:(void (^)(NSError * nullable))completionHandler;
- (UIImage *)getImageWithString:(NSString *)string;

@property NSMutableArray<MarsPhotoReference *> *photoReferences;
@property NSInteger sol;
@property BOOL solChanged;

@end

NS_ASSUME_NONNULL_END
