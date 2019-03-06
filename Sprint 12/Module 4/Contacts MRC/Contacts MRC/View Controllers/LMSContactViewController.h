//
//  LMSContactViewController.h
//  Contacts MRC
//
//  Created by Lisa Sampson on 3/6/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMSContact.h"
#import "LMSContactController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LMSContactViewController : UIViewController

@property LMSContact *contact;
@property LMSContactController *contactController;
@property NSString *segueIdentifier;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

- (IBAction)saveContact:(id)sender;

@end

NS_ASSUME_NONNULL_END
