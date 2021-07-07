//
//  SolDescription.m
//  Astronomy-Objc
//
//  Created by Nikita Thomas on 1/28/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "SolDescription.h"

@implementation SolDescription

- (instancetype)initWithSolNumber:(NSInteger)sol totalPhotos:(NSInteger)totalPhotos cameras:(NSArray<NSString *> *)cameras

{
    self = [super init];
    if (self) {
        _sol = sol;
        _totalPhotos = totalPhotos;
        _cameras = [cameras copy];
    }
    return self;
}




@end
