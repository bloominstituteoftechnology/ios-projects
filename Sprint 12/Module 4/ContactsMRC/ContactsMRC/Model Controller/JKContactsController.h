//
//  JKContactsController.h
//  ContactsMRC
//
//  Created by TuneUp Shop  on 3/7/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKContact.h"

@interface JKContactsController : NSObject

@property (nonatomic, readonly, strong, nonnull) NSMutableArray<JKContact *> *savedContacts;

- (instancetype)init;

- (void)saveContactWithName:(NSString *)name
                      email:(NSString *)phone
                      email:(NSString *)email;

@end

