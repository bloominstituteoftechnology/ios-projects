//
//  OSISolDescription.h
//  Objc Mars Rover
//
//  Created by Sergey Osipyan on 3/4/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSIMarsRover : NSObject


@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSDate *launchDate;
@property (nonatomic) NSData *landingDate;
@property (nonatomic, copy) NSArray *status;
@property (nonatomic) NSInteger maxSol;
@property (nonatomic) NSData *maxDate;
@property (nonatomic) NSInteger numberOfPhotos; //"totalPhotos"
@property (nonatomic) NSArray *solDescriptions; //  "photos"@property

@property (nonatomic, copy) NSString *active;
@property (nonatomic, copy) NSString *complete;


@end

NS_ASSUME_NONNULL_END
