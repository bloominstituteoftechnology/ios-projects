//
//  DetailedViewController.h
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHContact.h"
#import "BHContactsController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BHDetailedViewController : UIViewController

@property (retain, nullable) BHContact *contact;
@property (retain) BHContactsController *contactsController;
@property (nonatomic) BOOL isUpdatingView;
@property (retain, nonatomic) IBOutlet UITextField *nameTextField;
@property (retain, nonatomic) IBOutlet UITextField *emailTextField;
@property (retain, nonatomic) IBOutlet UITextField *phoneNumberTextField;
- (IBAction)saveButtonClicked:(id)sender;

@end

NS_ASSUME_NONNULL_END
