//
//  SolDescription.h
//  Astronomy-Objc
//
//  Created by Nikita Thomas on 1/28/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SolDescription : NSObject

- (instancetype)initWithSolNumber:(NSInteger)sol totalPhotos:(NSInteger)totalPhotos cameras: (NSArray<NSString *> *)cameras;

- (instancetype)initWithDict:(NSDictionary *)dict;

@property (nonatomic, readonly, copy) NSArray<NSString *> *cameras;
@property (nonatomic, readonly) NSInteger *totalPhotos;
@property (nonatomic, readonly) NSInteger *sol;

@end

NS_ASSUME_NONNULL_END
