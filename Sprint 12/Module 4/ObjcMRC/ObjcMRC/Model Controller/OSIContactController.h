//
//  OSISongController.h
//  Sprint11
//
//  Created by Sergey Osipyan on 3/1/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSIContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSIContactController : NSObject

@property (retain) NSMutableArray *contacts;


-(void)createContact:(NSString*)firstName lastName:(NSString*)lastname emailAddress:(NSString*)emailAddress phoneNumber:(NSString *)phoneNumber;

-(void)updateContact:(OSIContact *)conatct firstName:(NSString*)firstName lastName:(NSString*)lastName emailAddress:(NSString*)emailAddress phoneNumber:(NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END
