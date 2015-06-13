//
//  OktaPickerTextField.h
//  OktaApiClient
//
//  Created by Chandra Shirashyad on 12/30/14.
//  Copyright (c) 2014 Chandra Shirashyad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OktaPickerTextFieldHandler.h"

@interface OktaPickerTextField : UITextField <UIPickerViewDelegate,UIPickerViewDataSource> {
    NSArray *sourceStringsArray;
    OktaPickerTextFieldHandler * deleHandler;
    
}
@property (nonatomic, retain) UIPickerView *picker;
@property (nonatomic, assign) int pickedIndex;

-(void)setDataSource:(NSArray *) sourceArray andPlaceHolder:(NSString*)theholder;
-(void)pickerTextFieldDidBeginEditing;

@end
