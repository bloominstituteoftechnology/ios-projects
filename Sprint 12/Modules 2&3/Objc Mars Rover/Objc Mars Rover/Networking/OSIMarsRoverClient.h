//
//  OSIMarsRoverClient.h
//  Objc Mars Rover
//
//  Created by Sergey Osipyan on 3/4/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSIMarsRover.h"
#import "OSIMarsRoverPhoto.h"


@class MarsPhotoReference;


NS_ASSUME_NONNULL_BEGIN

@interface OSIMarsRoverClient : NSObject

@property (nonatomic, readonly) NSArray *savedPhotos;

- (instancetype)init;
- (void)fetchPhotosFrome:(OSIMarsRover *)rover onSol:(int )sol completion:(void (^)(NSArray<OSIMarsRoverPhoto *> *dict, NSError * _Nullable))completion;
- (void)searchForRover:(NSString *)roverName completion:(void (^)(OSIMarsRover *rover, NSError * _Nullable))completion;
@end

NS_ASSUME_NONNULL_END
