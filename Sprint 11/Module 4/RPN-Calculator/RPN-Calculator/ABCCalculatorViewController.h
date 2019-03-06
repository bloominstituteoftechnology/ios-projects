//
//  ABCCalculatorViewController.h
//  RPN-Calculator
//
//  Created by Austin Cole on 2/28/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCCalculator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ABCCalculatorViewController : UIViewController

//MARK: IBActions
- (IBAction)numberButtonTapped:(id)sender;
- (IBAction)decimalButtonTapped:(id)sender;
- (IBAction)divideButtonTapped:(id)sender;
- (IBAction)multiplyButtonTapped:(id)sender;
- (IBAction)subtractButtonTapped:(id)sender;
- (IBAction)addButtonTapped:(id)sender;
- (IBAction)returnButtonTapped:(id)sender;

//MARK: IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;


@end

NS_ASSUME_NONNULL_END
