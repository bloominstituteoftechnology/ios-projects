//
//  OSIMarsRoverClient.m
//  Objc Mars Rover
//
//  Created by Sergey Osipyan on 3/4/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSIMarsRoverClient.h"
#import "Objc_Mars_Rover-Swift.h"
// apiKey: A5GInzhik79kruLeQ4FYlN02lBcTmwnTnV5pHIKi
//  baseURL = URL(string: "https://api.nasa.gov/mars-photos/api/v1")!

@implementation OSIMarsRoverClient {
    NSMutableArray *_savedPhotos;
}

static NSString * const baseURL = @"https://api.nasa.gov/mars-photos/api/v1";
static NSString * const apiKey = @"A5GInzhik79kruLeQ4FYlN02lBcTmwnTnV5pHIKi";

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _savedPhotos = [NSMutableArray array];
    }
    return self;
}

- (NSArray *)savedPhotos {
    return [_savedPhotos copy];
}


- (void)savedPhoto:(OSIMarsPhoto *)photo {
    [_savedPhotos addObject:photo];
}

- (void)searchForPhotos:(NSString *)roverName sol:(NSInteger)sol completion:(OSIMarsPhotoCompletion)completion {

    
    NSURL *url = [NSURL URLWithString:baseURL];
   
    [url URLByAppendingPathComponent:@"rover"];
    [url URLByAppendingPathComponent:roverName];
    [url URLByAppendingPathComponent:@"photo"];
    
    NSURLComponents * urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];;
    NSNumber *solNumber = @(sol);
    NSString *solString = [NSNumberFormatter localizedStringFromNumber:solNumber numberStyle:NSNumberFormatterDecimalStyle];
    NSURLQueryItem *queryItemSol = [NSURLQueryItem queryItemWithName:@"sol" value:solString];
    NSURLQueryItem *queryItemApiKey = [NSURLQueryItem queryItemWithName:@"api_key" value:apiKey];
    [urlComponents setQueryItems:@[queryItemSol, queryItemApiKey]];
    
    NSURL *requestURL = [urlComponents URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
          
          if (error) {
              NSLog(@"Error fetching data: %@", error);
              completion(nil, error);
              return;
          }
          if (!data) {
              NSLog(@"Data is missing");
              completion(nil, [[NSError alloc] init]);
              return;
          }
          
          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
          if (![dict isKindOfClass:[NSDictionary class]]) {
              NSLog(@"JSON error, not dictinary");
              completion(nil, error);
              
              return;
          }
          
          NSString *dataAsStrig =[[NSString alloc]
                                  initWithData:data encoding:NSUTF8StringEncoding];
          NSLog(@"encoded to %@", dataAsStrig);
    
    
    
      }]resume];


}
    @end
    
