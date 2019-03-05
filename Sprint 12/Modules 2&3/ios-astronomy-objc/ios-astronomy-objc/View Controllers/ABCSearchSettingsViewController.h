//
//  SearchSettingsViewController.h
//  ios-astronomy-objc
//
//  Created by Austin Cole on 3/5/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NASAMarsPhotosNetworkingClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface ABCSearchSettingsViewController : UIViewController


- (IBAction)searchButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *solTextField;

@property NASAMarsPhotosNetworkingClient *networkingController;



@end

NS_ASSUME_NONNULL_END
