//
//  LMSContactViewController.m
//  Contacts MRC
//
//  Created by Lisa Sampson on 3/6/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSContactViewController.h"

@interface LMSContactViewController ()

@end

@implementation LMSContactViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _contact = [[LMSContact alloc] init];
        _contactController = [[LMSContactController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _contact = [[LMSContact alloc] init];
        _contactController = [[LMSContactController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    
}

- (void)updateViews {
    if (self.contact) {
        self.title = self.contact.name;
    self.nameTextField.text = self.contact.name;
    self.emailTextField.text = self.contact.email;
    self.phoneNumberTextField.text = self.contact.phoneNumber;
    }
}

- (IBAction)saveContact:(id)sender {
    NSString *name = _nameTextField.text;
    NSString *email = _emailTextField.text;
    NSString *phoneNumber = _phoneNumberTextField.text;
    
    if ([_segueIdentifier isEqualToString: @"EditContact"]) {
        [_contactController updateContact:_contact withName:name email:email andPhoneNumber:phoneNumber];
    } else {
        [_contactController createContactWithName:name email:email andPhoneNumber:phoneNumber];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
