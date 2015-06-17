//
//  OktaViewController.m
//  OktaApiClient
//
//  Created by Chandra Shirashyad on 12/17/2014.
//  Copyright (c) 2014 Chandra Shirashyad. All rights reserved.
//

#import "OktaViewController.h"

@interface OktaViewController ()

@property (weak, nonatomic) IBOutlet UITextView *APIResults;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIView *mfaView;
@property (weak, nonatomic) IBOutlet UITextField *mfaText;
@property (weak, nonatomic) IBOutlet OktaPickerTextField *mfaFactorTypeText;
@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (weak, nonatomic) IBOutlet UIButton *sendSMSButton;
@property (weak, nonatomic) IBOutlet UITextField *organization;

@property (strong, nonatomic) NSMutableArray* pickerData;
@property (strong, nonatomic) Authentication* auth;

@end

@implementation OktaViewController

- (IBAction)doAuthenticate:(id)sender {
    AuthAPIClient *doAuth = [[AuthAPIClient alloc] initWithOrgUrl:self.organization.text];
    [doAuth authenticate:self.username.text
                password:self.password.text
                 success:^(Authentication *auth) {
                     self.auth = auth;
                     [self processAuthentication];
                 } failure:^(NSError *error) {
                     self.APIResults.text = [error description];
                 }];
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
}

-(void) processAuthentication {
    self.APIResults.text = [NSString stringWithFormat:@"Status: %@\n User: %@ %@\nStateToken: %@\nExpires At: %@\n",
                            self.auth.status,
                            self.auth.user.profile.firstName,
                            self.auth.user.profile.lastName,
                            self.auth.stateToken,
                            self.auth.expiresAt];
    
    if (([self.auth.status  isEqual: @"MFA_REQUIRED"]))
    {
        self.mfaText.text = @"";
        self.questionText.text = @"";
        [self showMFAView];
    }
    else if (([self.auth.status  isEqual: @"MFA_CHALLENGE"]))
    {
        self.questionText.text = @"Please enter the passcode you received by SMS";
        self.sendSMSButton.hidden = YES;
        self.questionText.hidden = NO;
    }
    else if (([self.auth.status  isEqual: @"PASSWORD_EXPIRED"])) {
        self.mfaView.hidden = YES;
        [self performSegueWithIdentifier: @"changePasswordSegue" sender: self];
    }
    else if (([self.auth.status  isEqual: @"MFA_ENROLL"])) {
        self.mfaView.hidden = YES;
        [self performSegueWithIdentifier: @"MFAEnrollSegue" sender: self];
    }
    else {
        self.mfaView.hidden = YES;
    }
}

- (void) showMFAView {
    if (!self.pickerData) {
        self.pickerData = [[NSMutableArray alloc]init];
    }
    [self.pickerData removeAllObjects];
    for (Factor *fact in self.auth.factors)
    {
        [self.pickerData addObject:[NSString stringWithFormat:@"%@-%@", fact.provider, fact.factorType]];
    }
    [self.mfaFactorTypeText setDataSource:self.pickerData
                           andPlaceHolder:@"Select One"];
    [self.mfaFactorTypeText becomeFirstResponder];
    self.mfaView.hidden = NO;
}

- (IBAction)SendSMS:(id)sender {
    for (Factor *fact in self.auth.factors) {
        if ([fact.factorType isEqualToString:@"sms"]) {
            AuthAPIClient *authClient = [[AuthAPIClient alloc] initWithOrgUrl:self.organization.text];
            [authClient verifySMSFactor:fact.verify.href
                               stateToken:self.auth.stateToken
                                 passCode:@""
                                  success:^(Authentication *auth) {
                                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Pass Code Sent"
                                                                                      message:@"An SMS message has been sent to your phone. Please check and enter below."
                                                                                     delegate:self
                                                                            cancelButtonTitle:@"Close"
                                                                            otherButtonTitles:nil, nil];
                                      [alert show];
                                      self.auth = auth;
                                      [self processAuthentication];
                                  } failure:^(NSError *error) {
                                      self.APIResults.text = [error description];
                                  }];
        }
    }
}

- (IBAction)submitMFA:(id)sender {
    if ([self.mfaFactorTypeText.text  isEqual: @"OKTA-question"]) {
        for (Factor *fact in self.auth.factors) {
            if ([fact.factorType isEqualToString:@"question"]) {
                AuthAPIClient *authClient = [[AuthAPIClient alloc] initWithOrgUrl:self.organization.text];
                [authClient verifyQuestionFactor:fact.factorId
                                      stateToken:self.auth.stateToken
                                          answer:self.mfaText.text
                                       verifyUrl:fact.verify.href
                                         success:^(Authentication *auth) {
                    self.auth = auth;
                    [self processAuthentication];
                } failure:^(NSError *error) {
                    self.APIResults.text = [error description];
                }];
            }
        }
    }
    else if ([self.mfaFactorTypeText.text containsString:@"token:software:totp"]) {
        for (Factor *fact in self.auth.factors) {
            if ([fact.factorType isEqualToString:@"token:software:totp"]) {
                AuthAPIClient *authClient = [[AuthAPIClient alloc] initWithOrgUrl:self.organization.text];
                [authClient verifyTokenFactor:fact.verify.href
                                   stateToken:self.auth.stateToken
                                     passCode:self.mfaText.text
                                      success:^(Authentication *auth) {
                                          self.auth = auth;
                                          [self processAuthentication];
                                      } failure:^(NSError *error) {
                                          self.APIResults.text = [error description];
                                      }];
            }
        }
    }
    else if ([self.auth.status isEqualToString:@"MFA_CHALLENGE"]) {  //SMS Challenge Response
        AuthAPIClient *authClient = [[AuthAPIClient alloc] initWithOrgUrl:self.organization.text];
        [authClient verifySMSFactor:self.auth.next.href
                         stateToken:self.auth.stateToken
                           passCode:self.mfaText.text
                            success:^(Authentication *auth) {
                                self.auth = auth;
                                [self processAuthentication];
                            } failure:^(NSError *error) {
                                self.APIResults.text = [error description];
                            }];
    }
    self.mfaView.hidden = YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.username){
        [textField resignFirstResponder];
        [self.password becomeFirstResponder];
    } else if (textField == self.password){
        [self doAuthenticate:nil];
    } else if (textField == self.mfaText){
        [self submitMFA:nil];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.mfaFactorTypeText){
        if ([textField.text containsString:@"question"]) {
            self.sendSMSButton.hidden = YES;
            for (Factor *fact in self.auth.factors) {
                if ([fact.factorType isEqualToString:@"question"]) {
                    self.questionText.text = fact.questionFactorProfile.questionText;
                    self.questionText.hidden = NO;
                }
            }
        }
        else if ([textField.text  containsString: @"sms"]) {
            self.questionText.hidden = YES;
            self.sendSMSButton.hidden = NO;
        }
        else{
            self.sendSMSButton.hidden = YES;
            self.questionText.text = @"Please enter passcode.";
            self.questionText.hidden = NO;
        }
        [self.mfaText becomeFirstResponder];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mfaFactorTypeText.delegate = self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"changePasswordSegue"])
    {
        OktaChangePasswordViewController *vc = [segue destinationViewController];
        vc.auth = self.auth;
        vc.delegate = self;
    }
    else if ([[segue identifier] isEqualToString:@"MFAEnrollSegue"])
    {
        OktaMFAEnrollViewController *vc = [segue destinationViewController];
        vc.auth = self.auth;
        vc.delegate = self;
    }
}

- (void)changePasswordComplete:(OktaChangePasswordViewController *)controller authenticationObject:(Authentication *)auth
{
    self.auth = auth;
    [self processAuthentication];
}

- (void)MFAEnrollComplete:(OktaMFAEnrollViewController *)controller authenticationObject:(Authentication *)auth
{
    self.auth = auth;
    [self processAuthentication];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
