//
//  LMSCalculatorViewController.m
//  RPNCalculatorObjC
//
//  Created by Lisa Sampson on 2/28/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSCalculatorViewController.h"
#import "LMSCalculator.h"
#import "LMSDigitAccumulator.h"

@interface LMSCalculatorViewController ()

@property LMSCalculator *calculator;
@property LMSDigitAccumulator *digitAccumulator;
@property NSNumberFormatter *numberFormatter;

@end

@implementation LMSCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _calculator = [[LMSCalculator alloc] init];
    _digitAccumulator = [[LMSDigitAccumulator alloc] init];
    _numberFormatter = [[NSNumberFormatter alloc] init];
    
    self.numberFormatter.allowsFloats = YES;
    self.numberFormatter.maximumIntegerDigits = 20;
    self.numberFormatter.minimumFractionDigits = 0;
    self.numberFormatter.maximumFractionDigits = 20;
}

- (IBAction)tapNumberButton:(UIButton *)sender {
    [self.digitAccumulator addDigitWithNumericValue:sender.tag];
    [self updateTextFieldWithValue:self.digitAccumulator.value];
}

- (IBAction)tapDecimalButton:(UIButton *)sender {
    [self.digitAccumulator addDecimalPoint];
    [self updateTextFieldWithValue:self.digitAccumulator.value];
}

- (IBAction)tapReturnButton:(UIButton *)sender {
    double value = self.digitAccumulator.value;
    [self.calculator pushNumber:value];
    [self.digitAccumulator clear];
    [self updateTextFieldWithValue:self.digitAccumulator.value];
}

- (IBAction)tapAddButton:(UIButton *)sender {
    [self.calculator applyCalculatorOperator:LMSCalculatorOperatorAdd];
    [self updateTextFieldWithValue:self.calculator.topValue];
}

- (IBAction)tapSubtractButton:(UIButton *)sender {
    [self.calculator applyCalculatorOperator:LMSCalculatorOperatorSubtract];
    [self updateTextFieldWithValue:self.calculator.topValue];
}

- (IBAction)tapMultiplyButton:(UIButton *)sender {
    [self.calculator applyCalculatorOperator:LMSCalculatorOperatorMultiply];
    [self updateTextFieldWithValue:self.calculator.topValue];
}

- (IBAction)tapDivideButton:(UIButton *)sender {
    [self.calculator applyCalculatorOperator:LMSCalculatorOperatorDivide];
    [self updateTextFieldWithValue:self.calculator.topValue];
}

- (void)updateTextFieldWithValue: (double)value {
    NSString *valueString = [self.numberFormatter stringFromNumber:@(value)];
    [self.calculatorTextField setText: valueString];
}

@end
