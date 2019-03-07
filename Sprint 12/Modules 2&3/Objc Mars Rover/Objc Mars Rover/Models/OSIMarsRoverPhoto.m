//
//  OSIMarsRoverPhoto.m
//  Objc Mars Rover
//
//  Created by Sergey Osipyan on 3/7/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSIMarsRoverPhoto.h"

@implementation OSIMarsRoverPhoto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    
    NSNumber *identifier = dictionary[@"id"];
    self.identifier = identifier.integerValue;
    
    NSNumber *sol = dictionary[@"sol"];
    self.sol = sol.integerValue;
    

    
    NSString *imageURL = dictionary[@"img_src"];
    self.imageURL = [NSURL URLWithString:imageURL];
    
    return self;
}

@end
