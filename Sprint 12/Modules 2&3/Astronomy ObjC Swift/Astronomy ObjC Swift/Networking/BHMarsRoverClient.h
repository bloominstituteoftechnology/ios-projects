//
//  MarsRoverClient.h
//  Astronomy ObjC Swift
//
//  Created by Benjamin Hakes on 3/5/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHMarsRover.h"
#import "BHMarsPhotoReference.h"

typedef void (^FetchRoverCompletionBlock)(BHMarsRover *rover, NSError *error);
typedef void (^FetchPhotosCompletionBlock)(BHMarsPhotoReference *photoReference, NSError *error);

NS_ASSUME_NONNULL_BEGIN


@interface BHMarsRoverClient : NSObject

-(void)fetchMarsRoverNamed:(NSString *)name using:(NSURLSession *)session with:(FetchRoverCompletionBlock)completionBlock;

-(void)fetchPhotosFromRover:(BHMarsRover *)rover on:(NSInteger)sol using:(NSURLSession *)session with:(FetchPhotosCompletionBlock)completionBlock;
@end

NS_ASSUME_NONNULL_END
