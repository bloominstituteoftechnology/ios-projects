//
//  JKContactDetailViewController.m
//  ContactsMRC
//
//  Created by TuneUp Shop  on 3/7/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKContactDetailViewController.h"


@interface JKContactDetailViewController ()<UITextFieldDelegate>


@property (retain, nonatomic) IBOutlet UITextField *contactNameTextField;

@property (retain, nonatomic) IBOutlet UITextField *contactPhoneTextField;

@property (retain, nonatomic) IBOutlet UITextField *contactEmailTextField;

@property (nonatomic, readonly, nonnull) NSMutableArray<JKContact *> *savedContacts;


@end

@implementation JKContactDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    @autoreleasepool {
        _savedContacts = [[NSMutableArray alloc] init];

    }

    
}



- (IBAction)saveContact:(id)sender {
    @autoreleasepool {
         _contact = [[JKContact alloc] initWithName:_contactNameTextField.text email:_contactEmailTextField.text phone:_contactPhoneTextField.text];
    }
   
    [_savedContacts addObject:_contact];
    NSLog(@"%@", [_savedContacts firstObject]);
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)dealloc {
    [_contactNameTextField release];
    [_contactPhoneTextField release];
    [_contactEmailTextField release];
    [_contact release];
    [super dealloc];
}
@end
