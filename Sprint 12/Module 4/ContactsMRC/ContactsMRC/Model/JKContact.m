//
//  JKContact.m
//  ContactsMRC
//
//  Created by TuneUp Shop  on 3/7/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKContact.h"

@implementation JKContact

- (instancetype)initWithName:(NSString *)name email:(NSString *)email phone:(NSString *)phone
{
    self = [super init];
    if (self != nil) {
        _name = [name copy];
        _email = [email copy];
        _phone = [phone copy];
    }
    return self;
}

//- (instancetype)initWithDictionary:(NSDictionary *)dictionary
//{
//    NSString *name = dictionary[@"name"];
//    NSString *email = dictionary[@"email"];
//    NSString *phone = dictionary[@"phone"];
//    if (!name || !email || !phone) { return nil; }
//    
//    return [self initWithName:name email:email phone:phone];
//}



@end
