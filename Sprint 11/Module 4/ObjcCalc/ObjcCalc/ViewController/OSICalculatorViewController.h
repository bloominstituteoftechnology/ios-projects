//
//  OSICalculatorViewController.h
//  ObjcCalc
//
//  Created by Sergey Osipyan on 2/28/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OSICalculatorViewController : UIViewController

- (IBAction)numberButtonTapped:(id)sender;
- (IBAction)returnButtonTaped:(id)sender;
- (IBAction)addButtonTapped:(id)sender;
- (IBAction)subtractButtonTapped:(id)sender;
- (IBAction)multyplyButtonTapped:(id)sender;
- (IBAction)divideButtonTapped:(id)sender;
- (IBAction)decimalButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property NSNumberFormatter *numberFormater;

@end

NS_ASSUME_NONNULL_END
