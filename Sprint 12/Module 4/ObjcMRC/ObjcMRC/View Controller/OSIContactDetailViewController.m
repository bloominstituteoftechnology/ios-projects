
#import "OSIContactDetailViewController.h"
#import "OSIContactController.h"
#import "OSIContact.h"

@interface OSIContactDetailViewController ()


@property (retain, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *emailAddressTextFiled;
@property (retain, nonatomic) IBOutlet UITextField *phoneNumberTextFiled;
@property (retain, nonatomic) IBOutlet UITextView *textBodyTextView;

- (IBAction)saveButton:(id)sender;


@end

@implementation OSIContactDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    
   
}


- (void)saveButton:(id)sender {
    if (!self.conatct && (self.firstNameTextField.text.length > 0)) {
        NSString *firstName = self.firstNameTextField.text;
        NSString *lastName = self.lastNameTextField.text;
        NSString *emailAddress = self.emailAddressTextFiled.text;
        NSString *phoneNumber = self.phoneNumberTextFiled.text;
        
        [_osiContactController createContact:firstName lastName:lastName emailAddress:emailAddress phoneNumber:phoneNumber];
        
    } else {
        
        NSString *firstName = self.firstNameTextField.text;
        NSString *lastName = self.lastNameTextField.text;
        NSString *emailAddress = self.emailAddressTextFiled.text;
        NSString *phoneNumber = self.phoneNumberTextFiled.text;
        
        [_osiContactController updateContact:self.conatct firstName:firstName lastName:lastName emailAddress:emailAddress phoneNumber:phoneNumber];
        
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)updateViews {
    if (self.isViewLoaded == NO) { return ;}

    if (self.conatct == nil) {
        self.title = @"Add New Contact";
        
        self.firstNameTextField.text = @"";
        self.textBodyTextView.text = @"";
        self.lastNameTextField.text = @"";
        self.emailAddressTextFiled.text = @"";
        self.phoneNumberTextFiled.text = @"";
    } else {
        self.title = _conatct.firstName;
        self.firstNameTextField.text = _conatct.firstName;
        self.textBodyTextView.text = @"";
        self.lastNameTextField.text = _conatct.lastName;
        self.emailAddressTextFiled.text = _conatct.emailAddress;
        self.phoneNumberTextFiled.text = _conatct.phoneNumber;
    }
}

- (void)dealloc {
    [_firstNameTextField release];
    [_lastNameTextField release];
    [_emailAddressTextFiled release];
    [_phoneNumberTextFiled release];
    [_conatct release];
    [_osiContactController release];
    [_textBodyTextView release];
    [super dealloc];
}


@end
