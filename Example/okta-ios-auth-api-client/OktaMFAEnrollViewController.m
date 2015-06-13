//
//  OktaMFAEnrollViewController.m
//  OktaApiClient
//
//  Created by Chandra Shirashyad on 1/6/15.
//  Copyright (c) 2015 Chandra Shirashyad. All rights reserved.
//

#import "OktaMFAEnrollViewController.h"

@interface OktaMFAEnrollViewController()
@property (strong, nonatomic) NSMutableArray* pickerData;
@property (strong, nonatomic) NSMutableArray* questionData;
@property (strong, nonatomic) NSArray *questionProfiles;
@end


@implementation OktaMFAEnrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    factorTypePicker.delegate = self;
    if (!self.pickerData) {
        self.pickerData = [[NSMutableArray alloc]init];
    }
    [self.pickerData removeAllObjects];
    for (Factor *fact in self.auth.factors)
    {
        [self.pickerData addObject:[NSString stringWithFormat:@"%@-%@", fact.provider, fact.factorType]];
    }
    [factorTypePicker setDataSource:self.pickerData
                           andPlaceHolder:@"Select One"];
    [factorTypePicker becomeFirstResponder];
    
    selectQuestionView.hidden = YES;
}

- (IBAction)mfaEnrollCancelClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)mfaEnrollSubmitClicked:(id)sender {
    NSString *factorPickerText = factorTypePicker.text;
    if ([factorPickerText containsString:@"question"]) {
        Factor *fact = [self getFactor:@"question"];
        [self submitSecurityQuestion:fact];
    } else if ([factorPickerText containsString:@"token:software:totp"]) {
        Factor *fact = [self getFactor:@"token:software:totp"];
        [self submitToken:fact];
    } else if ([factorPickerText containsString:@"sms"]) {
        Factor *fact = [self getFactor:@"sms"];
        [self submitSms:fact];
    }
}

- (IBAction)activateTokenButtonClicked:(id)sender {
    AuthAPIClient *authClient = [[AuthAPIClient alloc] init];
//    [authClient verifyTokenFactor:self.auth.next.href
//                       stateToken:self.auth.stateToken
//                         passCode:enterTokenField.text
//                          success:^(Authentication *auth) {
//                              NSLog(@"Activation Success!");
//                              self.auth = auth;
//                              [self handleAuthSuccess:auth];
//                          } failure:^(NSError *error) {
//                              NSLog(@"%@", [error description]);
//                              APIResults.text = [error description];
//                          }];
}

- (IBAction)smsButtonClicked:(id)sender {
    if ([smsLabel.text containsString:@"Phone number"]) {
        NSString *phone = smsField.text;
        Factor *fact = [self getFactor:@"sms"];
        AuthAPIClient *authClient = [[AuthAPIClient alloc] init];
//        [authClient enrollSMSFactor:fact.factorType
//                         stateToken:self.auth.stateToken
//                           provider:fact.provider
//                        phoneNumber:phone
//                          enrollUrl:fact.enroll.href
//                            success:^(Authentication *auth) {
//                                NSLog(@"Enrollment Success!");
//                                self.auth = auth;
//                                [self handleAuthSuccess:auth];
//                                [self showActivateSms];
//                            } failure:^(NSError *error) {
//                                NSLog(@"%@", [error description]);
//                                APIResults.text = [error description];
//                            }];
    } else if ([smsLabel.text containsString:@"Verification code"]){
        AuthAPIClient *authClient = [[AuthAPIClient alloc] init];
//        [authClient verifySMSFactor:self.auth.next.href
//                         stateToken:self.auth.stateToken
//                           passCode:smsField.text
//                            success:^(Authentication *auth) {
//                                NSLog(@"Activation Success!");
//                                self.auth = auth;
//                                [self handleAuthSuccess:auth];
//                            } failure:^(NSError *error) {
//                                NSLog(@"%@", [error description]);
//                                APIResults.text = [error description];
//                            }];
    }
}

- (void)showActivateSms {
    smsField.text = @"";
    smsLabel.text = @"Verification code: ";
    [smsButton setTitle:@"Activate" forState:UIControlStateNormal];
}

- (Factor *)getFactor:(NSString *)keyword {
    for (Factor *fact in self.auth.factors) {
        if ([fact.factorType isEqualToString:keyword]) {
            return fact;
        }
    }
    NSLog(@"Chosen MFA not supported.");
    return nil;
}

- (void)submitSecurityQuestion:(Factor *)fact {
    AuthAPIClient *authClient = [[AuthAPIClient alloc] init];
    NSString *chosenQuestion = securityQuestionPicker.text;
    QuestionFactorProfile *profile = [[QuestionFactorProfile alloc] init];
    for (QuestionFactorProfile * qProfile in self.questionProfiles) {
        if ([qProfile.questionText isEqualToString:chosenQuestion]) {
            profile = qProfile;
            profile.answer = securityAnswerTextField.text;
            break;
        }
    }
//    [authClient enrollQuestionFactor:fact.factorType
//                          stateToken:self.auth.stateToken
//                            provider:fact.provider
//                             profile:profile
//                           enrollUrl: fact.enroll.href
//                             success:^(Authentication *auth) {
//                                 NSLog(@"Enrollment Success!");
//                                 self.auth = auth;
//                                 [self handleAuthSuccess:auth];
//                             }
//                             failure:^(NSError *error) {
//                                 NSLog(@"%@", [error description]);
//                                 APIResults.text = [error description];
//                             }];
}

- (void)submitToken:(Factor *)fact {
    AuthAPIClient *authClient = [[AuthAPIClient alloc] init];
//    [authClient enrollTokenFactor:fact.factorType
//                       stateToken:self.auth.stateToken
//                         provider:fact.provider
//                        enrollUrl:fact.enroll.href
//                          success:^(Authentication *auth) {
//                              NSLog(@"Enrollment Success!");
//                              self.auth = auth;
//                              [self handleAuthSuccess:auth];
//                              [self showActivationView];
//                          }
//                          failure:^(NSError *error) {
//                              NSLog(@"%@", [error description]);
//                              APIResults.text = [error description];
//                          }];
}

- (void)submitSms:(Factor *)fact {
    [self onOktaSmsFactorSelected];
}

- (void)handleAuthSuccess:(Authentication *)auth {
    APIResults.text = [NSString stringWithFormat:@"Status: %@\n User: %@ %@\nStateToken: %@\nExpires At: %@\n",
                       auth.status,
                       auth.user.profile.firstName,
                       auth.user.profile.lastName,
                       auth.stateToken,
                       auth.expiresAt];
}

- (void)showActivationView {
    tokenActivationView.hidden = NO;
    NSString *credentialId = self.auth.factor.totpFactorProfile.credentialId;
    NSString *sharedSecret = self.auth.factor.totpFactorActivation.sharedSecret;
    credentialIdLabel.text = [NSString stringWithFormat:@"Account: %@", credentialId];
    sharedSecretLabel.text = [NSString stringWithFormat:@"Key: %@", sharedSecret];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == factorTypePicker) {
        // choosing MFA method
        if ([textField.text containsString:@"OKTA-question"]) {
            [self onSecurityQuestionFactorSelected];
        }
        
        else if ([textField.text containsString: @"-token"]) {
            [self onTokenFactorSelected];
        }
        
        else if ([textField.text containsString: @"OKTA-sms"]) {
            [self onOktaSmsFactorSelected];
        }
    }
}

- (void)onSecurityQuestionFactorSelected {
    for (Factor *fact in self.auth.factors) {
        if ([fact.factorType isEqualToString:@"question"]) {
            // Get questions and display
            AuthAPIClient *authClient = [[AuthAPIClient alloc] init];
//            [authClient getQuestionsList:fact.questions.href success:^(NSArray *questions) {
//                selectQuestionView.hidden = NO;
//                self.questionProfiles = questions;
//                [self populateQuestionPicker:questions];
//                NSLog(@"%@", questions);
//            } failure:^(NSError *error) {
//                NSLog(@"%@", error.description);
//            }];
            return;
        }
    }
    
    NSLog(@"Error: self.auth.factors array doesn't contain the selected MFA method");
}

- (void)populateQuestionPicker:(NSArray *)questions {
    securityQuestionPicker.delegate = self;
    if (!self.questionData) {
        self.questionData = [[NSMutableArray alloc] init];
    }
    [self.questionData removeAllObjects];
    for (QuestionFactorProfile *question in questions)
    {
        [self.questionData addObject:[NSString stringWithFormat:@"%@", question.questionText]];
    }
    [securityQuestionPicker setDataSource:self.questionData
                    andPlaceHolder:@"Select a Security Question"];
    [securityQuestionPicker becomeFirstResponder];
}

- (void)onTokenFactorSelected {
    Factor *fact = [self getFactor:@"token:software:totp"];
    [self submitToken:fact];
}

- (void)onOktaSmsFactorSelected {
    smsView.hidden = NO;
    smsLabel.text = @"Phone number: ";
    [smsButton setTitle:@"Send code" forState:UIControlStateNormal];
}

@end
