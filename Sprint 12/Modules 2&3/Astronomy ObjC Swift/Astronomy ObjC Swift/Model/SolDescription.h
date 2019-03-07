//
//  SolDescription.h
//  Astronomy ObjC Swift
//
//  Created by Benjamin Hakes on 3/5/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BHSolDescription : NSObject

@property NSInteger *sol;
@property NSInteger *totalPhotos;
@property NSArray<NSString *> *cameras;

@end

NS_ASSUME_NONNULL_END
