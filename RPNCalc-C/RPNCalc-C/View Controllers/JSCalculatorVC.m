//
//  JSCalculatorVC.m
//  RPNCalc-C
//
//  Created by Jeffrey Santana on 10/10/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import "JSCalculatorVC.h"

@interface JSCalculatorVC ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)numberButtonTapped:(UIButton *)sender;
- (IBAction)clearButtonPressed:(UIButton *)sender;
- (IBAction)decimalButtonTapped:(UIButton *)sender;
- (IBAction)divideButtonTapped:(UIButton *)sender;
- (IBAction)multiplyButtonTapped:(UIButton *)sender;
- (IBAction)plusButtonTapped:(UIButton *)sender;
- (IBAction)subtractButtonTapped:(UIButton *)sender;
- (IBAction)returnButtonTapped:(UIButton *)sender;


@end

@implementation JSCalculatorVC
/*
 //MARK: - IBOutlets
 
 @IBOutlet weak var textField: UITextField!
 
 //MARK: - Properties
 
 private let numberFormatter: NumberFormatter = {
	 let formatter = NumberFormatter()
	 formatter.maximumIntegerDigits = 20
	 formatter.minimumFractionDigits = 0
	 formatter.maximumFractionDigits = 20    // don't round!
	 //        formatter.alwaysShowsDecimalSeparator
	 formatter.numberStyle = NumberFormatter.Style.decimal
	 return formatter
 }()
 
 private var calculator = Calculator() {
	 didSet {
		 guard let value = calculator.topValue else { return }
		 
		 textField.text = numberFormatter.string(from: value as NSNumber)
		 updateViews()
	 }
 }
 
 private var digitAccumulator = DigitAccumulator() {
	 didSet {
		 // Don't format, we want to show keys as typed (0.002)
		 // Otherwise decimal doesn't display properly
		 textField.text = digitAccumulator.stringValue
		 updateViews()
	 }
 }
 
 //MARK: - Life Cycle
 
 override func viewDidLoad() {
	 super.viewDidLoad()
	 
	 
 }
 
 //MARK: - IBActions
 
 @IBAction func clearButtonPressed(_ sender: Any) {
	 calculator.clear()
	 digitAccumulator.clear()
 }
 
 @IBAction func divideButtonTapped(_ sender: Any) {
	 addNumber()
	 calculator.push(operator: .divide)
 }
 
 @IBAction func multiplyButtonTapped(_ sender: Any) {
	 addNumber()
	 calculator.push(operator: .multiply)
 }
 
 @IBAction func plusButtonTapped(_ sender: Any) {
	 addNumber()
	 calculator.push(operator: .add)
 }
 
 @IBAction func subtractButtonTapped(_ sender: Any) {
	 addNumber()
	 calculator.push(operator: .subtract)
 }
 
 @IBAction func numberButtonTapped(_ sender: UIButton) {
	 try? digitAccumulator.add(.number(sender.tag))
 }
 
 @IBAction func decimalButtonTapped(_ sender: Any) {
	 try? digitAccumulator.add(.decimalPoint)
 }
 
 @IBAction func returnButtonTapped(_ sender: Any) {
	 addNumber()
 }
 
 //MARK: - Helpers
 
 func updateViews() {
	 
 }
 
 func addNumber() {
	 // TODO: Test nil condition for accumulator
	 guard let value = digitAccumulator.value else { return }
	 
	 calculator.push(number: value)
	 
	 digitAccumulator.clear()
	 textField.text = numberFormatter.string(from: value as NSNumber) // Reset the text to give feedback of what was entered (with decimal)
	 print(calculator)
 }
 */

- (IBAction)numberButtonTapped:(UIButton *)sender {
	
}
- (IBAction)clearButtonPressed:(UIButton *)sender {
	
}
- (IBAction)divideButtonTapped:(UIButton *)sender {
	
}
- (IBAction)returnButtonTapped:(UIButton *)sender {
	
}
- (IBAction)plusButtonTapped:(UIButton *)sender {
	
}
- (IBAction)subtractButtonTapped:(UIButton *)sender {
	
}
- (IBAction)multiplyButtonTapped:(UIButton *)sender {
	
}
- (IBAction)decimalButtonTapped:(UIButton *)sender {
	
}
@end
