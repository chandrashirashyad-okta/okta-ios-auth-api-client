//
//  OktaChangePasswordViewController.m
//  OktaApiClient
//
//  Created by Chandra Shirashyad on 1/2/15.
//  Copyright (c) 2015 Chandra Shirashyad. All rights reserved.
//

#import "OktaChangePasswordViewController.h"
#import "OktaViewController.h"

@interface OktaChangePasswordViewController ()

@property (weak, nonatomic) IBOutlet UITextField *oldPassword;
@property (weak, nonatomic) IBOutlet UITextField *nuevoPassword;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UITextView *APIResults;

@end

@implementation OktaChangePasswordViewController

- (IBAction)changePasswordSubmitClicked:(id)sender {
    if (![self.nuevoPassword.text isEqualToString:self.confirmPassword.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mismatch"
                                                        message:@"New and Confirm Passwords do not match"
                                                       delegate:self
                                              cancelButtonTitle:@"Close"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    OktaViewController * o = (OktaViewController *) sender;
    AuthAPIClient *doAuth = [[AuthAPIClient alloc] initWithOrgUrl:@"https://shirashyad.oktapreview.com"];
    [doAuth changeExpiredPassword:self.auth.stateToken
                      oldPassword:self.oldPassword.text
                    nuevoPassword:self.nuevoPassword.text
                          nextUrl:self.auth.next.href
                          success:^(Authentication *auth) {
                              self.auth = auth;
                              [self.delegate changePasswordComplete:self authenticationObject:auth];
                              [self dismissViewControllerAnimated:YES completion:nil];
                          }
                          failure:^(NSError *error) {
                              self.APIResults.text = [error description];
                          }];
}

- (IBAction)changePasswordCancelClicked:(id)sender {
    self.oldPassword.text = @"";
    self.nuevoPassword.text = @"";
    self.confirmPassword.text = @"";
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.oldPassword){
        [textField resignFirstResponder];
        [self.nuevoPassword becomeFirstResponder];
    }else if (textField == self.nuevoPassword){
        [textField resignFirstResponder];
        [self.confirmPassword becomeFirstResponder];
    }else if (textField == self.confirmPassword){
        [self changePasswordSubmitClicked:nil];
    }
    return YES;
}

@end
