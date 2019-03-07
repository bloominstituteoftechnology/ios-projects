//
//  OSIMarsRoverPhoto.h
//  Objc Mars Rover
//
//  Created by Sergey Osipyan on 3/7/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@interface OSIMarsRoverPhoto : NSObject
@property NSInteger identifier;
@property NSInteger sol;

@property NSDate *earthDate;
@property NSURL *imageURL;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
