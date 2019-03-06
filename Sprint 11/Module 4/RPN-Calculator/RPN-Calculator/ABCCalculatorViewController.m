//
//  ABCCalculatorViewController.m
//  RPN-Calculator
//
//  Created by Austin Cole on 2/28/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCCalculatorViewController.h"
#import "ABCCalculator.h"
#import "ABCDigitAccumulator.h"

@interface ABCCalculatorViewController ()

@property ABCCalculator *calculator;
@property ABCDigitAccumulator *digitAccumulator;

@end

@implementation ABCCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _calculator = [[ABCCalculator alloc] init];
    _digitAccumulator = [[ABCDigitAccumulator alloc] init];
    
}

- (IBAction)numberButtonTapped:(id)sender {
    NSInteger number = [sender tag];
    [_digitAccumulator addDigitWithNumericValue:number];
}

- (IBAction)decimalButtonTapped:(id)sender {
    [_digitAccumulator addDecimalPoint];
}

- (IBAction)divideButtonTapped:(id)sender {
    [_calculator applyOperator:divideNumber];
    [self returnButtonTapped:sender];

}

- (IBAction)multiplyButtonTapped:(id)sender {
    [_calculator applyOperator:multiplyNumber];
    [self returnButtonTapped:sender];

}

- (IBAction)subtractButtonTapped:(id)sender {
    [_calculator applyOperator:subtractNumber];
    [self returnButtonTapped:sender];

}

- (IBAction)addButtonTapped:(id)sender {
    [_calculator applyOperator:addNumber];
    [self returnButtonTapped:sender];

}

- (IBAction)returnButtonTapped:(id)sender {
    double accumulatedValue = [_digitAccumulator value];
    [_calculator pushNumber:accumulatedValue];
    [_digitAccumulator clear];
    NSNumber *value = [_calculator topValue];
    if (value != nil) {
        _numberTextField.text = [value stringValue];
    } else {
        _numberTextField.text = @"";
    }
}

//MARK: Other Methods

@end
