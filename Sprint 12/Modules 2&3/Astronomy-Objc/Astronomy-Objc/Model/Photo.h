//
//  Photo.h
//  Astronomy-Objc
//
//  Created by Nikita Thomas on 1/28/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject

- (instancetype)initWithIdentifier:(NSInteger)identifier sol:(NSInteger)sol earthDate:(NSString *)earthDate imageURL:(NSURL *)imageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, readonly) NSInteger sol;
@property (nonatomic, readonly, copy) NSString *earthDate;
@property (nonatomic, readonly, copy) NSURL *imageURL;

@end

NS_ASSUME_NONNULL_END
