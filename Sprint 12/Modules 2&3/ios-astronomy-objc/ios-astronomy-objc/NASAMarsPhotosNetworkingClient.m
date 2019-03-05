//
//  NASAMarsPhotosNetworkingClient.m
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/4/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "NASAMarsPhotosNetworkingClient.h"

@implementation NASAMarsPhotosNetworkingClient

- (void)fetchPhotosWithRover:(NSString *)rover withSol:(NSInteger)sol completion:(void (^)(NSError * ))completionHandler {
    
    NSURL *baseURL = [[NSURL alloc] initWithString:@"https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos:"];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:NO];
    NSString *solString = [[NSString alloc] initWithFormat:@"%lu", sol ];
    urlComponents.queryItems = @[
                                 [NSURLQueryItem queryItemWithName:@"sol" value: solString]
                                 ];
    NSURL *requestURL = [urlComponents.URL URLByAppendingPathComponent:@"5Hf9vF43KsheHcegx6M5NlCH2hF89JhsapeCoOnP"];
    
    [[NSURLSession.sharedSession dataTaskWithURL:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"");
            completionHandler(error);
            return;
        }
        if (data != nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
    
            completionHandler(nil);
            return;
        }
    }] resume];
}

@end
