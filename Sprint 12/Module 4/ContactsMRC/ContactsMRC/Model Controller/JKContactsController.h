//
//  JKContactsController.h
//  ContactsMRC
//
//  Created by TuneUp Shop  on 3/7/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKContact.h"

@interface JKContactsController : NSObject {
    NSMutableArray *_savedContacts;
}

@property (nonatomic, readonly, retain, nonnull) NSMutableArray<JKContact *> *savedContacts;

+ (id)sharedController;

//- (void)saveContactWithName:(NSString *)name
//                      email:(NSString *)phone
//                      email:(NSString *)email;

@end

