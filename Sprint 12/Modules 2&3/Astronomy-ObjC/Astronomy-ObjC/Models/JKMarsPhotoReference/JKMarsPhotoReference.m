//
//  JKMarsPhotoReference.m
//  Astronomy-ObjC
//
//  Created by TuneUp Shop  on 3/4/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKMarsPhotoReference.h"

@implementation JKMarsPhotoReference

- (instancetype)initWithId:(int)identifier sol:(int)sol camera:(Camera *)camera earthDate:(NSDate *)earthDate imgSrc:(NSURL *)imgSrc
{
    self = [super init];
    if (self != nil) {
        _identifier = identifier;
        _sol = sol;
        _camera = camera;
        _earthDate = earthDate;
        _imgSrc = imgSrc;
    }
    return self;
}

@end
