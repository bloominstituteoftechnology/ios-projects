//
//  Rover.h
//  Astronomy-Objc
//
//  Created by Nikita Thomas on 1/28/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rover : NSObject

-(instancetype)initWithName:(NSString *)name
                 launchDate:(NSString *)launchDate
                landingDate:(NSString *)landingDate
                     status:(NSString *)status
                     maxSol:(NSInteger)maxSol
                    maxDate:(NSString *)maxDate
                totalPhotos:(NSInteger)totalPhotos;
//            solDescriptions:(NSArray<SolDescription *> *)solDescriptions;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

//@property (nonatomic, readonly, copy) NSArray<SolDescription *> *solDescriptions;
@property (nonatomic, readonly, copy) NSString *launchDate;
@property (nonatomic, readonly, copy) NSString *maxDate;
@property (nonatomic, readonly, copy) NSString *status;
@property (nonatomic, readonly) NSInteger maxSol;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) NSInteger totalPhotos;
@property (nonatomic, readonly, copy) NSString *landingDate;


@end

NS_ASSUME_NONNULL_END
