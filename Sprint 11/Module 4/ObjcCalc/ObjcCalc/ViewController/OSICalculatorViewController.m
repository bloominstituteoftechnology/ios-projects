//
//  OSICalculatorViewController.m
//  ObjcCalc
//
//  Created by Sergey Osipyan on 2/28/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSICalculatorViewController.h"
#import "OSICalculator.h"
#import "OSIDigitAccumulator.h"

@interface OSICalculatorViewController ()
@property OSICalculator *osiCalculator;
@property OSIDigitAccumulator *osiDigitAccumulator;
@end

@implementation OSICalculatorViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    _osiCalculator = [[OSICalculator alloc] init];
    _osiDigitAccumulator = [[OSIDigitAccumulator alloc] init];
    _numberFormater = [[NSNumberFormatter alloc] init];
    
    _numberFormater.allowsFloats = YES;
    _numberFormater.maximumIntegerDigits = 20;
    _numberFormater.minimumFractionDigits = 0;
    _numberFormater.maximumFractionDigits = 20;
}

- (void)updateTextFieldWithValue: (double)value {
    NSString *valueString = [self.numberFormater stringFromNumber:@(value)];
    [_textField setText: valueString];
}

- (IBAction)numberButtonTapped:(id)sender {
    double number = [sender tag];
    [_osiDigitAccumulator addDigitWithNumericValue:number];
    [self updateTextFieldWithValue:_osiDigitAccumulator.value];
}

- (IBAction)returnButtonTaped:(id)sender {
    
    double value = self.osiDigitAccumulator.value;
    [_osiCalculator pushNumber:value];
    [_osiDigitAccumulator clear];
    [self updateTextFieldWithValue:_osiDigitAccumulator.value];
}

- (IBAction)addButtonTapped:(id)sender {
    [_osiCalculator applyOperator: OSICalcOperatorsAdd];
    [self updateTextFieldWithValue:_osiCalculator.topValue];
}

- (IBAction)subtractButtonTapped:(id)sender {
    [_osiCalculator applyOperator:OSICalcOperatorsSubtract];
    [self updateTextFieldWithValue:_osiCalculator.topValue];
}

- (IBAction)multyplyButtonTapped:(id)sender {
    [_osiCalculator applyOperator:OSICalcOperatorsMultiply];
    [self updateTextFieldWithValue:_osiCalculator.topValue];
}

- (IBAction)divideButtonTapped:(id)sender {
    [_osiCalculator applyOperator:OSICalcOperatorsDivide];
    [self updateTextFieldWithValue:_osiCalculator.topValue];
}

- (IBAction)decimalButtonTapped:(id)sender {
    [self.osiDigitAccumulator addDecimalPoint];
    [self updateTextFieldWithValue:self.osiDigitAccumulator.value];
}
@end
