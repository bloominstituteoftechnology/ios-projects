//
//  SearchSettingsViewController.m
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/5/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCSearchSettingsViewController.h"
#import "ios_astronomy_objc-Swift.h"

@interface ABCSearchSettingsViewController ()

@end

@implementation ABCSearchSettingsViewController

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

- (IBAction)searchButtonTapped:(id)sender {
    _networkingController.sol = [[[NSString alloc] initWithString:_solTextField.text] integerValue];
    _networkingController.solChanged = YES;
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    [navigationController popViewControllerAnimated:YES];

}
@end
