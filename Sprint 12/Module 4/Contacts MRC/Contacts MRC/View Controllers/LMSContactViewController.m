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
    _nameTextField.text = _contact.name;
    _emailTextField.text = _contact.email;
    _phoneNumberTextField.text = _contact.phoneNumber;
}

- (IBAction)saveContact:(id)sender {
    _contact.name = _nameTextField.text;
    _contact.email = _emailTextField.text;
    _contact.phoneNumber = _phoneNumberTextField.text;
    
    if ([_segueIdentifier isEqual: @"EditSegue"]) {
        [_contactController updateContact:_contact];
    } else {
        [_contactController createContact:_contact];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
