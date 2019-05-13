//
//  JKContactDetailViewController.h
//  ContactsMRC
//
//  Created by TuneUp Shop  on 3/7/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKContactsController.h"
#import "JKContactsTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JKContactDetailViewController : UIViewController {
    JKContactsController *sharedController;
}

@property (nonatomic, nullable, strong) JKContact *contact;
//@property (nonatomic, nullable, strong) JKContactsController *contactController;

@end

NS_ASSUME_NONNULL_END
