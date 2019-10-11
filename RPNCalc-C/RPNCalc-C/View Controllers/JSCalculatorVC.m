//
//  JSCalculatorVC.m
//  RPNCalc-C
//
//  Created by Jeffrey Santana on 10/10/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import "JSCalculatorVC.h"
#import "JSCalculator.h"
#import "JSDigitAccumulator.h"

@interface JSCalculatorVC ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic) NSNumberFormatter *numberFormatter;
@property JSCalculator *calculator;
@property JSDigitAccumulator * digitAccumulator;

- (IBAction)numberButtonTapped:(UIButton *)sender;
- (IBAction)clearButtonPressed:(UIButton *)sender;
- (IBAction)decimalButtonTapped:(UIButton *)sender;
- (IBAction)divideButtonTapped:(UIButton *)sender;
- (IBAction)multiplyButtonTapped:(UIButton *)sender;
- (IBAction)plusButtonTapped:(UIButton *)sender;
- (IBAction)subtractButtonTapped:(UIButton *)sender;
- (IBAction)returnButtonTapped:(UIButton *)sender;

- (void)addNumber;
- (void)updateCalculator;
- (void)updateAccumulator;

@end

@implementation JSCalculatorVC

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (self) {
		_digitAccumulator = [[JSDigitAccumulator alloc] init];
		_calculator = [[JSCalculator alloc] init];
	}
	return self;
}

- (IBAction)numberButtonTapped:(UIButton *)sender {
	[self.digitAccumulator addDigitWithNumericValue:sender.tag];
	[self updateAccumulator];
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
	[self.calculator clear];
	[self.digitAccumulator clear];
	self.textField.text = @"";
}

- (IBAction)divideButtonTapped:(UIButton *)sender {
	[self addNumber];
	[self.calculator applyOperator:divide];
	[self updateCalculator];
}

- (IBAction)returnButtonTapped:(UIButton *)sender {
	[self addNumber];
	[self updateCalculator];
}

- (IBAction)plusButtonTapped:(UIButton *)sender {
	[self addNumber];
	[self.calculator applyOperator:add];
	[self updateCalculator];
}

- (IBAction)subtractButtonTapped:(UIButton *)sender {
	[self addNumber];
	[self.calculator applyOperator:subtract];
	[self updateCalculator];
}

- (IBAction)multiplyButtonTapped:(UIButton *)sender {
	[self addNumber];
	[self.calculator applyOperator:multiply];
	[self updateCalculator];
}

- (IBAction)decimalButtonTapped:(UIButton *)sender {
	[self.digitAccumulator addDecimalPoint];
	[self updateAccumulator];
}

- (NSNumberFormatter *)numberFormatter {
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	formatter.maximumIntegerDigits = 20;
	formatter.minimumFractionDigits = 0;
	formatter.maximumFractionDigits = 20;
	[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
	return formatter;
}

- (void)addNumber {
	double value = self.digitAccumulator.value;
	if (value) {
		[self.calculator pushNumber:value];
		self.textField.text = self.digitAccumulator.stringValue;
		[self.digitAccumulator clear];
	}
}

- (void)updateCalculator {
	NSNumber *value = [NSNumber numberWithInt:self.calculator.topValue];
	self.textField.text = [self.numberFormatter stringFromNumber:value];
}

- (void)updateAccumulator {
	self.textField.text = self.digitAccumulator.stringValue;
}

@end
