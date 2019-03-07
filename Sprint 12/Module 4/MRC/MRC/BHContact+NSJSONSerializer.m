//
//  BHContact+NSJSONSerializer.m
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHContact+NSJSONSerializer.h"

@implementation BHContact (NSJSONSerializer)

-(NSDictionary *)makeDictionaryFromContact: (BHContact *)contact{
    
    NSDictionary *bottomLevelDictionary = [NSDictionary dictionaryWithObjectsAndKeys: contact.name, @"name", contact.email, @"email", contact.phoneNumber, @"phoneNumber", contact.uuid, @"uuid", nil];
    
    return bottomLevelDictionary;
    
}

@end
