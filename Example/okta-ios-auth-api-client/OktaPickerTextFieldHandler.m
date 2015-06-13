//
//  OktaPickerTextFieldHandler.m
//  OktaApiClient
//
//  Created by Chandra Shirashyad on 12/30/14.
//  Copyright (c) 2014 Chandra Shirashyad. All rights reserved.
//

#import "OktaPickerTextFieldHandler.h"
#import "OktaPickerTextField.h"

@implementation OktaPickerTextFieldHandler

#pragma mark -
#pragma mark UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [(OktaPickerTextField*) textField pickerTextFieldDidBeginEditing];
    
}

@end
