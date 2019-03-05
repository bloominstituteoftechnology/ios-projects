//
//  NASAMarsPhotosNetworkingClient.m
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/4/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "NASAMarsPhotosNetworkingClient.h"
#import "ios_astronomy_objc-Swift.h"

@implementation NASAMarsPhotosNetworkingClient

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photoReferences = [[NSMutableArray<MarsPhotoReference *> alloc]init];
        _sol = 2;
    }
    return self;
}

- (void)fetchPhotosWithRover:(NSString *)rover completion:(void (^)(NSError * ))completionHandler {
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/"];
    NSURL *baseURL = [url URLByAppendingPathComponent:@"photos"];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:NO];
    NSString *solString = [[NSString alloc] initWithFormat:@"%lu", _sol ];
    urlComponents.queryItems = @[
                                 [NSURLQueryItem queryItemWithName:@"sol" value: solString],
                                 [NSURLQueryItem queryItemWithName:@"api_key" value: @"5Hf9vF43KsheHcegx6M5NlCH2hF89JhsapeCoOnP"]
                                 ];
    NSURL *requestURL = urlComponents.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"");
            completionHandler(error);
            return;
        }
        if (data != nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *photos = json[@"photos"];
            MarsPhotoReference *photoReference = [[MarsPhotoReference alloc] init];
            for (NSDictionary *photoDictionary in photos) {
                [photoDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
                    SEL selector = NSSelectorFromString(key);
                    if ([photoReference respondsToSelector:selector]) {
                        [photoReference setValue:value forKey:key];
                    }
                }];
                [self->_photoReferences addObject:photoReference];
            }
    
            completionHandler(nil);
            return;
        }
    }] resume];
}

@end
