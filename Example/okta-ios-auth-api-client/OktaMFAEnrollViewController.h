//
//  OktaMFAEnrollViewController.h
//  OktaApiClient
//
//  Created by Chandra Shirashyad on 1/6/15.
//  Copyright (c) 2015 Chandra Shirashyad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OktaPickerTextField.h"
#import "Models.h"
#import "AuthAPIClient.h"

@class OktaMFAEnrollViewController;

@protocol OktaMFAEnrollViewControllerDelegate <NSObject>

- (void)MFAEnrollComplete:(OktaMFAEnrollViewController *)controller authenticationObject:(Authentication *)auth;
@end

@interface OktaMFAEnrollViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet OktaPickerTextField *factorTypePicker;
    IBOutlet OktaPickerTextField * securityQuestionPicker;
    IBOutlet UIView *selectQuestionView;
    IBOutlet UITextField *securityAnswerTextField;
    IBOutlet UITextView *APIResults;
    IBOutlet UIView *tokenActivationView;
    IBOutlet UILabel *credentialIdLabel;
    IBOutlet UILabel *sharedSecretLabel;
    IBOutlet UITextField *enterTokenField;
    IBOutlet UIButton *activateButton;
    IBOutlet UIView *smsView;
    IBOutlet UILabel *smsLabel;
    IBOutlet UITextField *smsField;
    IBOutlet UIButton *smsButton;
}

@property (nonatomic) Authentication* auth;
@property (nonatomic, weak) id <OktaMFAEnrollViewControllerDelegate> delegate;

- (IBAction)mfaEnrollSubmitClicked:(id)sender;
- (IBAction)activateTokenButtonClicked:(id)sender;
- (IBAction)smsButtonClicked:(id)sender;

@end
