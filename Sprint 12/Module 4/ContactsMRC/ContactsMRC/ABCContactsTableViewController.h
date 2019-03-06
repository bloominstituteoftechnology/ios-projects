//
//  ABCContactsTableViewController.h
//  ContactsMRC
//
//  Created by Austin Cole on 3/6/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCContactController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ABCContactsTableViewController : UITableViewController

@property(retain) ABCContactController *contactController;

@end

NS_ASSUME_NONNULL_END
