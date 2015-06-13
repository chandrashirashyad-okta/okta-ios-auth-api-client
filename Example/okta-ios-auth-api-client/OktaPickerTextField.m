//
//  OktaPickerTextField.m
//  OktaApiClient
//
//  Created by Chandra Shirashyad on 12/30/14.
//  Copyright (c) 2014 Chandra Shirashyad. All rights reserved.
//

#import "OktaPickerTextField.h"

@interface OktaPickerTextField()
- (void) setup;
@end

@implementation OktaPickerTextField
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void) awakeFromNib{
    [super awakeFromNib];
    [self setup];
    
}

- (void) setup{
    self.pickedIndex=-1;
    deleHandler=[[OktaPickerTextFieldHandler alloc]init];
    self.delegate=(id)deleHandler;
}

-(void)setDataSource:(NSArray *) sourceArray andPlaceHolder:(NSString*)theholder
{
    [self setPlaceholder:theholder];
    sourceStringsArray=[[NSArray alloc] initWithArray:sourceArray];
    //setup pickerview here
    
    if (!self.picker) {
        self.picker=[[UIPickerView alloc] init];
        self.inputView=self.picker;
    }
    
    [self.picker setFrame:CGRectMake(0, 40, 320, 216)];
    self.picker.delegate=self;
    self.picker.dataSource=self;
    self.picker.showsSelectionIndicator=YES;

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(doneSelection:)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, 40, 320, 40)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    NSArray *toolbarItems = [NSArray arrayWithObjects: 
                             doneButton, nil];
    [toolBar setItems:toolbarItems];

    self.inputAccessoryView = toolBar;

    if (self.pickedIndex!=-1) {
        [self setText:[sourceStringsArray objectAtIndex:self.pickedIndex]];
    }
}

-(IBAction)doneSelection:(id)sender{
    ;
    self.text = [sourceStringsArray objectAtIndex:[self.picker selectedRowInComponent:0]];
    [self resignFirstResponder];
}

#pragma mark -
#pragma mark PickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [sourceStringsArray count];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *cellLable = (UILabel*) view;
    if (cellLable == nil)
    {
        cellLable = [[UILabel alloc] init];
        [cellLable setFrame:CGRectMake(40, 5, 260, 40)];
        cellLable.backgroundColor=[UIColor clearColor];
        cellLable.numberOfLines=2;
        cellLable.font=[UIFont boldSystemFontOfSize:16];
    }

    cellLable.text=[sourceStringsArray objectAtIndex:row];
    return cellLable ;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.text=[sourceStringsArray objectAtIndex:row];
    self.pickedIndex = (int) row;
}

#pragma mark -
#pragma mark Forwarded UITextFieldDelegate
-(void) pickerTextFieldDidBeginEditing{
    if (self.pickedIndex==-1) {
        self.pickedIndex=0;
        [self setText:[sourceStringsArray objectAtIndex:self.pickedIndex]];
    }
    [self.picker selectRow:self.pickedIndex inComponent:0 animated:NO];
}

@end
