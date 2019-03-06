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
    // Do any additional setup after loading the view.
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
    NSString *name = _nicknameTextField.text;
    NSString *emailAddress = _nicknameTextField.text;
    NSNumber *phoneNumber = @([_nicknameTextField.text integerValue]);
    if (_contact != nil) {
        if (name.length == 0 || phoneNumber == nil) {
            return;
        }
        [_contactController createContactWithName:name withPhoneNumber:phoneNumber withNickName:nickname withEmailAddress:emailAddress];
    } else {
        if (_contact != nil) {
            if (name.length == 0 || phoneNumber == nil) {
                return;
            }
            [_contactController editContact:_contact withName:name withPhoneNumber:phoneNumber withNickName:nickname withEmailAddress:emailAddress];
        }
    }
    [nickname release];
    [name release];
    [emailAddress release];
    [phoneNumber release];
}
@end
