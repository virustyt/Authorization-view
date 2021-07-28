//
//  ViewController.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 22.07.2021.
//

#import "AuthorizationViewController.h"
#import "RSTextField.h"
#import "RSButton.h"
#import "CypherView.h"

#import "AuthorizationViewController+UITextFieldDelegate.h"
#import "UIFont+ForTitle.h"
#import "UIControl+OnOffAlpha.h"

static NSString * const gPageTitle = @"Authorization";
static NSString * const gLoginFieldPlaceholder = @"Login";
static NSString * const gPasswordFieldPlaceholder = @"Password";
static NSString * const gAuthorizationButtonTitle = @"Authorize";

static NSString * const gCorrectLogin = @"login";
static NSString * const gCorrectPassword = @"password";

static const CGFloat padding = 36.0;
static const CGFloat verticalSmallSpacing = 30.0;
static const CGFloat verticalBigSpacing = 100.0;
static const CGFloat verticalMidSpacing = 60.0;

@interface AuthorizationViewController ()

@property (nonatomic) NSMutableArray* correctCypherCode;
@property (nonatomic) UILabel* pageTitleLabel;
@property (nonatomic) RSTextField* loginField;
@property (nonatomic) RSTextField* passwordField;
@property (nonatomic) UIButton* authorizationButton;
@property (nonatomic) CypherView* cypherView;

@end

@implementation AuthorizationViewController

// MARK: - Private interface
-(NSMutableArray*) correctCypherCode{
    return [@[@(One),@(Three),@(Two)] mutableCopy];
}

-(void) authorizationButtonTap:(RSButton*) sender {
    BOOL isPasswordCorrect = false;
    BOOL isLoginCorrect = false;
    [self.loginField updateState:Failure];
    [self.passwordField updateState:Failure];
    
    if ([self.loginField.text  isEqual:gCorrectLogin] ) {
        isLoginCorrect = true;
        [self.loginField updateState:Sucsess];
    }
    if ([self.passwordField.text isEqual:gCorrectPassword]) {
        isPasswordCorrect = true;
        [self.passwordField updateState:Sucsess];
    }

    if (isLoginCorrect && isPasswordCorrect) {
        [UIView animateWithDuration:0.3 animations:^{
            [self.loginField updateState:Sucsess];
            [self.passwordField updateState:Sucsess];
            
            [self.loginField off];
            [self.passwordField off];
            [self.authorizationButton off];
            self.cypherView.hidden = false;
            for (id view in self.cypherView.subviews){
                ((UIView*) view).hidden = false;
                if ([view isKindOfClass:UIStackView.class]) {
                    for (id button in ((UIStackView*) view).subviews) {
                        ((UIView*) button).hidden = false;
                    }
                }
            }
            
        }];
    }
}

-(void) presentAlert{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Welcome!"
                                                             message:@"You are successfuly authorized!"
                                                             preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"Refresh"
                                            style:UIAlertActionStyleDestructive
                                            handler: ^(UIAlertAction *action) {
        __weak typeof(self) weakSelf = self;
        [weakSelf.loginField updateState:Waiting];
        [weakSelf.passwordField updateState:Waiting];
        [weakSelf.cypherView updateState:Waiting];
        
        [weakSelf.loginField on];
        [weakSelf.passwordField on];
        [weakSelf.authorizationButton on];
        
        weakSelf.cypherView.hidden = true;
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:true completion:^{}];
}

//MARK: -UI implementation
-(void) SetUpAppearence{
    [self.view addSubview:self.pageTitleLabel];
    [self.view addSubview:self.loginField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.authorizationButton];
    [self.view addSubview:self.cypherView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.pageTitleLabel.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor],
        [self.pageTitleLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:80.0],
    
        [self.loginField.topAnchor constraintEqualToAnchor:self.pageTitleLabel.bottomAnchor constant: verticalBigSpacing],
        [self.loginField.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:padding],
        [self.loginField.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-padding],
    
        [self.passwordField.topAnchor constraintEqualToAnchor:self.loginField.bottomAnchor constant:verticalSmallSpacing],
        [self.passwordField.centerXAnchor constraintEqualToAnchor:self.loginField.centerXAnchor],
        [self.passwordField.leadingAnchor constraintEqualToAnchor:self.loginField.leadingAnchor],
        [self.passwordField.trailingAnchor constraintEqualToAnchor:self.loginField.trailingAnchor],
        
        [self.authorizationButton.topAnchor constraintEqualToAnchor:self.passwordField.bottomAnchor constant:verticalMidSpacing],
        [self.authorizationButton.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor],
        
        [self.cypherView.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor],
        [self.cypherView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant: -padding]]
    ];
}

-(UILabel*) pageTitleLabel{
    if (_pageTitleLabel) {
        return _pageTitleLabel;
    } else {
        UILabel *label = [[UILabel alloc] init];
        
        label.text = gPageTitle;
        label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
        label.translatesAutoresizingMaskIntoConstraints = false;
        
        self.pageTitleLabel = label;
        return label;
    }
}

-(RSTextField*) loginField {
    if (_loginField) {
        return _loginField;
    } else {
        RSTextField* loginTextField = [[RSTextField alloc] initWithFrame:CGRectZero];
        
        loginTextField.keyboardType = UIKeyboardTypeAlphabet;
        loginTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        loginTextField.placeholder = gLoginFieldPlaceholder;
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false;
        loginTextField.delegate = self;
        
        self.loginField = loginTextField;
        return loginTextField;
    }
}

-(RSTextField*) passwordField {
    if (_passwordField){
        return _passwordField;
    } else {
        RSTextField *textField = [[RSTextField alloc] initWithFrame:CGRectZero];
        
        textField.placeholder = gPasswordFieldPlaceholder;
        textField.secureTextEntry = true;
        
        textField.translatesAutoresizingMaskIntoConstraints = false;
        textField.delegate = self;
        
        self.passwordField = textField;
        return textField;
    }
}

-(UIButton*) authorizationButton {
    if (_authorizationButton) {
        return _authorizationButton;
    }else {
        RSButton *button = [[RSButton alloc] initWithFrame:CGRectZero];
        
        [button setTitle:gAuthorizationButtonTitle forState:UIControlStateNormal];
        button.translatesAutoresizingMaskIntoConstraints = false;
        [button addTarget:self
                action:@selector(authorizationButtonTap:)
                forControlEvents:UIControlEventTouchUpInside];
        
        self.authorizationButton = button;
        return button;
    }
}

-(CypherView*) cypherView {
    if (_cypherView) {
        return _cypherView;
    } else {
        CypherView *cypherView = [[CypherView alloc] initWithFrame:CGRectZero];
        __weak typeof(self) weakSelf = self;
        
        cypherView.validationHandler = ^(NSMutableArray *cases) {
            if (weakSelf && [cases isEqualToArray:weakSelf.correctCypherCode]) {
                [weakSelf.cypherView updateState:Sucsess];
                [weakSelf presentAlert];
            } else {
                [weakSelf.cypherView updateState:Failure];
            }
        };
        cypherView.translatesAutoresizingMaskIntoConstraints = false;
        _cypherView.hidden = true;
        
        self.cypherView = cypherView;
        return cypherView;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self SetUpAppearence];
    //[UIFont fontNamesForFamilyName:@"SF Mono"];
}



@end
