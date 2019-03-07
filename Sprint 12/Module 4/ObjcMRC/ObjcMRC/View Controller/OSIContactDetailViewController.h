//
//  OSISongDetailViewController.h
//  Sprint11
//
//  Created by Sergey Osipyan on 3/1/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSIContact.h"
#import "OSIContactController.h"


NS_ASSUME_NONNULL_BEGIN

@interface OSIContactDetailViewController : UIViewController
@property (retain, nullable) OSIContact *conatct;
@property (retain) OSIContactController *osiContactController;
@end

NS_ASSUME_NONNULL_END
