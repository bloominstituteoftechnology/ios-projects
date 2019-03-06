//
//  ABCContactDetailViewController.h
//  ContactsMRC
//
//  Created by Austin Cole on 3/6/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCContactController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ABCContactDetailViewController : UIViewController

@property (retain) ABCContactController *contactController;
@property (retain) ABCContact *contact;

@property (retain, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (retain, nonatomic) IBOutlet UITextField *realNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *emailAddressTextField;
@property (retain, nonatomic) IBOutlet UITextField *phoneNumberTextField;

- (IBAction)saveContactButtonTapped:(id)sender;


@end

NS_ASSUME_NONNULL_END
