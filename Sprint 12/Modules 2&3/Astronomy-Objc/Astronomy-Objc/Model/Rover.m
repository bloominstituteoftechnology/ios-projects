//
//  Rover.m
//  Astronomy-Objc
//
//  Created by Nikita Thomas on 1/28/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "Rover.h"

@implementation Rover

- (instancetype)initWithName:(NSString *)name launchDate:(NSString *)launchDate landingDate:(NSString *)landingDate status:(NSString *)status maxSol:(NSInteger)maxSol maxDate:(NSString *)maxDate totalPhotos:(NSInteger)totalPhotos
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _launchDate = [launchDate copy];
        _landingDate = [landingDate copy];
        _status = [status copy];
        _maxSol = maxSol;
        _maxDate = [maxDate copy];
        _totalPhotos = totalPhotos;

    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *launchDate = dictionary[@"launch_date"];
    NSString *landingDate = dictionary[@"landing_date"];
    NSString *status = dictionary[@"status"];
    NSString *maxSolString = dictionary[@"max_sol"];
    NSInteger maxSol = [maxSolString integerValue];
    NSString *maxDate = dictionary[@"max_date"];
    NSString *totalPhotosString = dictionary[@"total_photos"];
    NSInteger totalPhotos = [totalPhotosString integerValue];
    
    return [self initWithName:name launchDate:launchDate landingDate:landingDate status:status maxSol:maxSol maxDate:maxDate totalPhotos:totalPhotos];
}



@end
