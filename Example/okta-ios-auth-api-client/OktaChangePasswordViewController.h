//
//  OktaChangePasswordViewController.h
//  OktaApiClient
//
//  Created by Chandra Shirashyad on 1/2/15.
//  Copyright (c) 2015 Chandra Shirashyad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Models.h"
#import "AuthAPIClient.h"

@class OktaChangePasswordViewController;

@protocol OktaChangePasswordViewControllerDelegate <NSObject>
- (void)changePasswordComplete:(OktaChangePasswordViewController *)controller authenticationObject:(Authentication *)auth;
@end

@interface OktaChangePasswordViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic) Authentication* auth;
@property (nonatomic, weak) id <OktaChangePasswordViewControllerDelegate> delegate;

@end
