//
//  DetailedViewController.m
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHDetailedViewController.h"

@interface BHDetailedViewController ()

@end

@implementation BHDetailedViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _contact = [[BHContact alloc] init];
        _contactsController = [[BHContactsController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _contact = [[BHContact alloc] init];
        _contactsController = [[BHContactsController alloc] init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateViews];
    
}

-(void)updateViews{
    
    _nameTextField.text = [_contact name];
    _emailTextField.text = [_contact email];
    _phoneNumberTextField.text = [_contact phoneNumber];

}

- (void)dealloc {
    [_nameTextField release];
    [_emailTextField release];
    [_phoneNumberTextField release];
    [super dealloc];
}
- (IBAction)saveButtonClicked:(id)sender {
    
    _contact.name = [_nameTextField text];
    _contact.email = [_emailTextField text];
    _contact.phoneNumber = [_phoneNumberTextField text];
    
    if (_isUpdatingView) {
        [_contactsController updateContact:_contact];
    } else {
        [_contactsController createContact:_contact];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
