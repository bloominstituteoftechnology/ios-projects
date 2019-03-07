//
//  BHContact+NSJSONSerializer.h
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface BHContact (NSJSONSerializer)

-(NSDictionary *)makeDictionaryFromContact: (BHContact *)contact;

@end

NS_ASSUME_NONNULL_END
