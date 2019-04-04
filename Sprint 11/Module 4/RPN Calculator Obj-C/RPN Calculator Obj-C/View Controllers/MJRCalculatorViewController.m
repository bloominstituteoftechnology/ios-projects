//
//  MJRCalculatorViewController.m
//  RPN Calculator Obj-C
//
//  Created by Moses Robinson on 3/28/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRCalculatorViewController.h"
#import "MJRCalculator.h"
#import "MJRDigitAccumulator.h"

@interface MJRCalculatorViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic) NSNumberFormatter *numberFormatter;
@property (nonatomic) MJRCalculator *calculator;
@property (nonatomic) MJRDigitAccumulator *digitAccumulator;

@end

@implementation MJRCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _calculator = [[MJRCalculator alloc] init];
    _digitAccumulator = [[MJRDigitAccumulator alloc] init];
}

- (NSNumberFormatter *)numberFormatter
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.allowsFloats = true;
    formatter.maximumIntegerDigits = 20;
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 20;
    return formatter;
}

- (void)setCalculator:(MJRCalculator *)calculator
{
    if (calculator != _calculator) {
        
        _calculator = calculator;
        
        NSNumber *value = [self.calculator topValue];
        
        if (value) {
            self.textField.text = [self.numberFormatter stringFromNumber:value];
        } else {
            self.textField.text = @"";
        }
    }
}

- (void)setDigitAccumulator:(MJRDigitAccumulator *)digitAccumulator
{
    if (digitAccumulator != _digitAccumulator) {
        
        _digitAccumulator = digitAccumulator;
        
        NSNumber *value = [NSNumber numberWithDouble: [self.digitAccumulator value]];
        if (value) {
            self.textField.text = [self.numberFormatter stringFromNumber:value];
        } else {
            self.textField.text = @"";
        }
    }
}

- (IBAction)numberButtonTapped:(id)sender {
    NSInteger senderTag = [sender tag];
    [self.digitAccumulator addDigitWithNumericValue:senderTag];
}

- (IBAction)decimalButtonTapped:(id)sender {
    [self.digitAccumulator addDecimalPoint];
}

- (IBAction)returnButtonTapped:(id)sender {
    NSInteger value = [self.digitAccumulator value];
    if (value) {
        [self.calculator pushNumber:value];
    }
    [self.digitAccumulator clear];
}

- (IBAction)divideButtonTapped:(id)sender {
    [self.calculator applyOperator:divide];
}

- (IBAction)multiplyButtonTapped:(id)sender {
    [self.calculator applyOperator:multiply];
}

- (IBAction)subtractButtonTapped:(id)sender {
    [self.calculator applyOperator:subtract];
}

- (IBAction)plusButtonTapped:(id)sender {
    [self.calculator applyOperator:add];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self.calculator clear];
    [self.digitAccumulator clear];
    return true;
}

@end
