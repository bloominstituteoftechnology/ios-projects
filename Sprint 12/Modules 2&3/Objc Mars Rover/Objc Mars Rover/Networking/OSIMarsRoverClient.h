//
//  OSIMarsRoverClient.h
//  Objc Mars Rover
//
//  Created by Sergey Osipyan on 3/4/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSIMarsPhoto.h"


typedef void(^OSIMarsPhotoCompletion)(OSIMarsPhoto * _Nullable, NSError * _Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface OSIMarsRoverClient : NSObject

@property (nonatomic, readonly) NSArray *savedPhotos;

- (instancetype)init;

- (void)savedPhoto:(OSIMarsPhoto *)photo;
- (void)searchForPhotos:(NSString *)roverName sol:(NSInteger)sol;
@end

NS_ASSUME_NONNULL_END
