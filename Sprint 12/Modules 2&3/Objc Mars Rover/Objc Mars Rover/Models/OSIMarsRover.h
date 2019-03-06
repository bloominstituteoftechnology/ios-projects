//
//  OSISolDescription.h
//  Objc Mars Rover
//
//  Created by Sergey Osipyan on 3/4/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Objc_Mars_Rover-Swift.h"



@class OSIMarsRover;
@class OSIPhoto;
@class OSICamera;

NS_ASSUME_NONNULL_BEGIN

@interface OSICamera : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (OSICamera *)chemcam;
+ (OSICamera *)fhaz;
+ (OSICamera *)mahli;
+ (OSICamera *)mardi;
+ (OSICamera *)mast;
+ (OSICamera *)navcam;
+ (OSICamera *)rhaz;
@end



@interface OSIMarsRover : NSObject
@property (nonatomic, nullable, copy)   NSString *name;
@property (nonatomic, nullable, copy)   NSString *landingDate;
@property (nonatomic, nullable, copy)   NSString *launchDate;
@property (nonatomic, nullable, copy)   NSString *status;
@property (nonatomic, nullable, strong) NSNumber *maxSol;
@property (nonatomic, nullable, copy)   NSString *maxDate;
@property (nonatomic, nullable, strong) NSNumber *totalPhotos;
@property (nonatomic, nullable, copy)   NSArray<OSIPhoto *> *photos;
@end


@interface OSIPhoto : NSObject
@property (nonatomic, nullable, strong) NSNumber *sol;
@property (nonatomic, nullable, copy)   NSString *earthDate;
@property (nonatomic, nullable, strong) NSNumber *totalPhotos;
@property (nonatomic, nullable, copy)   NSArray<OSICamera *> *cameras;
@end

NS_ASSUME_NONNULL_END

