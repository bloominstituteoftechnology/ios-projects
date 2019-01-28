//
//  Photo.m
//  Astronomy-Objc
//
//  Created by Nikita Thomas on 1/28/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithIdentifier:(NSInteger)identifier sol:(NSInteger)sol earthDate:(NSString *)earthDate imageURL:(NSURL *)imageURL
{
    self = [super init];
    if (self) {
        _identifier = identifier;
        _sol = sol;
        _earthDate = [earthDate copy];
        _imageURL = [imageURL copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *solString = dictionary[@"sol"];
    NSString *identifierString = dictionary[@"id"];
    NSString *imageURLString = dictionary[@"img_src"];
    NSURL *imageURL = [[NSURL alloc] initWithString:imageURLString];
    NSInteger sol = [solString integerValue];
    NSString *earthDateString = dictionary[@"earth_date"];
    
    
    NSInteger identifier = [identifierString integerValue];
    return [self initWithIdentifier:identifier sol:sol earthDate:earthDateString imageURL:imageURL];
}

@end
