//
//  MarsRoverClient.m
//  Astronomy ObjC Swift
//
//  Created by Benjamin Hakes on 3/5/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHMarsRoverClient.h"

@interface BHMarsRoverClient()

// MARK: - Private Properties
@property (copy, nullable) NSURL *baseURL;
@property (copy, nonnull) NSString *apiKey;

- (void)fetchFromURL:(NSURL *)url using:(NSURLSession *)session with:(FetchPhotosCompletionBlock)completionBlock;

- (NSURL *)urlForInfoForRoverWithName: (NSString *)roverName;
- (NSURL *)urlForPhotosFromRoverWithName: (NSString *)roverName on:(NSString *)sol;

@end

@implementation BHMarsRoverClient


-(instancetype)init{
    self = [super init];
    if (self) {
        
        // set up MarsRoverClient
        _baseURL = [NSURL URLWithString: @"https://api.nasa.gov/mars-photos/api/v1"];
        _apiKey = @"hUayQbzfP0PEV0zspgWJC8djuhf1AinUxaD9xWsU";
    }
    return self;
}

// MARK: - Private Methods
-(void)fetchMarsRoverNamed:(NSString *)name using:(NSURLSession *)session with:(FetchRoverCompletionBlock)completionBlock {

    
}

-(void)fetchPhotosFromRover:(BHMarsRover *)rover on:(NSInteger)sol using:(NSURLSession *)session with:(FetchPhotosCompletionBlock)completionBlock{
    
    
}

- (void)fetchFromURL:(NSURL * _Nullable)url using:(NSURLSession *)session with:(FetchPhotosCompletionBlock)completionBlock{
    
    [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        if (error) {
            NSLog(@"Error fetching data from NASA API: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        if (data == nil){
            NSLog(@"No data returned from NASA API: %@", error);
            completionBlock(nil, error);
        }
        
        @try {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            if (![dictionary isKindOfClass:[NSDictionary class]]) {
                NSLog(@"JSON is not a dictionary");
                completionBlock(nil, [[NSError alloc] init]);
                return;
            }
        }
        @catch (NSException *exception) {
            completionBlock(nil, error);
        }
        @finally {
            
        }
        
    
    }]
     resume];
    
}


- (NSURL *)urlForInfoForRoverWithName: (NSString *)roverName {
    NSURL *url = [self baseURL];
    [url URLByAppendingPathComponent:@"manifests"];
    [url URLByAppendingPathComponent:roverName];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:true];
    NSURLQueryItem *item1 = [[NSURLQueryItem alloc] initWithName:@"api_key" value:_apiKey];
    
    urlComponents.queryItems = @[item1];
    
    return urlComponents.URL;
}

- (NSURL *)urlForPhotosFromRoverWithName: (NSString *)roverName on:(NSString *)sol {
    NSURL *url = [self baseURL];
    [url URLByAppendingPathComponent:@"rovers"];
    [url URLByAppendingPathComponent:roverName];
    [url URLByAppendingPathComponent:@"photos"];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:true];
    NSURLQueryItem *item1 = [[NSURLQueryItem alloc] initWithName:@"sol" value:sol];
    NSURLQueryItem *item2 = [[NSURLQueryItem alloc] initWithName:@"api_key" value:_apiKey];
    
    urlComponents.queryItems = @[item1, item2];
    
    return urlComponents.URL;
}


@end
