//
//  JKMarsPhotoReference.h
//  Astronomy-ObjC
//
//  Created by TuneUp Shop  on 3/4/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Astronomy_ObjC-Swift.h"

@class Camera;

NS_ASSUME_NONNULL_BEGIN

@interface JKMarsPhotoReference : NSObject

- (instancetype)initWithId:(int)identifier
                       sol:(int)sol
                    camera:(Camera *)camera
                 earthDate:(NSDate *)earthDate
                    imgSrc:(NSURL *)imgSrc;

@property (nonatomic, copy, readonly) Camera *camera;
@property (nonatomic, copy, readonly) NSDate *earthDate;
@property (nonatomic, readonly) int identifier;
@property (nonatomic, readonly) int sol;
@property (nonatomic, copy, readonly) NSURL *imgSrc;


@end

NS_ASSUME_NONNULL_END
