//
//  OSIMarsRover.h
//  Objc Mars Rover
//
//  Created by Sergey Osipyan on 3/4/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSIMarsPhoto : NSObject

@property (nonatomic) NSInteger photoId;
@property (nonatomic) NSInteger sol;
@property (nonatomic, copy) NSDate *earthDate;
@property (nonatomic) NSURL *imageURL;
@property (nonatomic) NSArray *camera;


@property (nonatomic) NSInteger roverId;
@property (nonatomic) NSInteger cameraId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *fullName;

@end

NS_ASSUME_NONNULL_END
