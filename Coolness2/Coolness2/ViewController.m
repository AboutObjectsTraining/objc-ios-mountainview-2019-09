// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "ViewController.h"
#import "CLNCoolViewCell.h"

@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, strong) IBOutlet UIView *accessoryView;
@end

@implementation ViewController

- (IBAction) addCell {
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    [self.contentView addSubview: newCell];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.greenColor;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
}

@end
