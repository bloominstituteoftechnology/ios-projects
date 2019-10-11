//
//  REPCalculatorViewController.m
//  ObjC RPN Calc
//
//  Created by Michael Redig on 10/10/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPCalculatorViewController.h"
#import "REPDigitAccumulator.h"
#import "REPCalculator.h"

@interface REPCalculatorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (readonly) REPDigitAccumulator* digitAccumulator;
@property (readonly) REPCalculator* calculator;

@end



@implementation REPCalculatorViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (self) {
		[self configureInternals];
	}
	return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		[self configureInternals];
	}
	return self;
}

- (void)configureInternals {
	_digitAccumulator = [[REPDigitAccumulator alloc] init];
	_calculator = [[REPCalculator alloc] init];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)updateViews {
	NSString* viewedText = @"";
	if (self.digitAccumulator.stringValue.length > 0) {
		viewedText = self.digitAccumulator.stringValue;
		self.textField.textColor = [UIColor redColor];
	} else if ([self.calculator topValue]) {
		viewedText = self.calculator.topValue.stringValue;
		self.textField.textColor = [UIColor blackColor];
	}
	self.textField.text = viewedText;
}

- (void)addNumberToStack {
	if (self.digitAccumulator.stringValue.length == 0) {
		return;
	}

	[self.calculator pushNumber:self.digitAccumulator.value];
	[self.digitAccumulator clear];
	[self updateViews];
}


- (IBAction)numberButtonPressed:(UIButton *)sender {
	[self.digitAccumulator addDigitWithNumericValue:(int)sender.tag];
	[self updateViews];
}

- (IBAction)decimalButtonPressed:(UIButton *)sender {
	[self.digitAccumulator addDecimalPoint];
	[self updateViews];
}

- (IBAction)subtractButtonPressed:(UIButton *)sender {
	[self addNumberToStack];
	[self.calculator applyOperator:subtract];
	[self updateViews];
}

- (IBAction)addButtonPressed:(UIButton *)sender {
	[self addNumberToStack];
	[self.calculator applyOperator:add];
	[self updateViews];
}

- (IBAction)multiplyButtonPressed:(UIButton *)sender {
	[self addNumberToStack];
	[self.calculator applyOperator:multiply];
	[self updateViews];
}

- (IBAction)divideButtonPressed:(UIButton *)sender {
	[self addNumberToStack];
	[self.calculator applyOperator:divide];
	[self updateViews];
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
	[self.digitAccumulator clear];
	[self.calculator clear];
	[self updateViews];
}

- (IBAction)returnButtonPressed:(UIButton *)sender {
	[self addNumberToStack];
	[self updateViews];
}

@end
