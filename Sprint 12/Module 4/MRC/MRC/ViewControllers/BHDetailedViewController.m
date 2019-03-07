//
//  DetailedViewController.m
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHDetailedViewController.h"
#import "BHContactsController.h"
#import "BHContact.h"

@interface BHDetailedViewController ()

@end

@implementation BHDetailedViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
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
    [_contact release];
    [_contactsController release];
    [super dealloc];
}
- (IBAction)saveButtonClicked:(id)sender {
    
    _contact.name = [_nameTextField text];
    _contact.email = [_emailTextField text];
    _contact.phoneNumber = [_phoneNumberTextField text];
    
    if (_isUpdatingView) {
        [_contactsController
         updateContact:_contact];
    } else {
        [_contactsController createContact:_contact];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
