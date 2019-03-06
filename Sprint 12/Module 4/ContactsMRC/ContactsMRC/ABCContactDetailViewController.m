//
//  ABCContactDetailViewController.m
//  ContactsMRC
//
//  Created by Austin Cole on 3/6/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCContactDetailViewController.h"

@interface ABCContactDetailViewController ()

@end

@implementation ABCContactDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_contact != nil) {
        [[self navigationItem] setTitle: _contact.name];
        _nicknameTextField.text = _contact.nickName;
        _realNameTextField.text = _contact.name;
        _emailAddressTextField.text = _contact.emailAddress;
        _phoneNumberTextField.text = [_contact.phoneNumber stringValue];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)dealloc {
    [_nicknameTextField release];
    [_realNameTextField release];
    [_emailAddressTextField release];
    [_phoneNumberTextField release];
    [_contactController release];
    [_contact release];
    [super dealloc];
}
- (IBAction)saveContactButtonTapped:(id)sender {
    NSString *nickname = _nicknameTextField.text;
    NSString *name = _realNameTextField.text;
    NSString *emailAddress = _emailAddressTextField.text;
    NSNumber *phoneNumber = @([_phoneNumberTextField.text integerValue]);
    if (_contact == nil) {
        if (name.length == 0 || phoneNumber == nil) {
            return;
        }
        [_contactController createContactWithName:name withPhoneNumber:phoneNumber withNickName:nickname withEmailAddress:emailAddress];
    } else {
        if (name.length == 0 || phoneNumber == nil) {
            return;
        }
        [_contactController editContact:_contact withName:name withPhoneNumber:phoneNumber withNickName:nickname withEmailAddress:emailAddress];
    }
    [self.navigationController popToViewController:self.navigationController.viewControllers[0] animated: true];
}
@end
