// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "ViewController.h"
#import "CLNCoolViewCell.h"

@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation ViewController

- (void)addCell {
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    [self.contentView addSubview: newCell];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.greenColor;
}

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(UIScreen.mainScreen.bounds, &accessoryRect, &contentRect, 140, CGRectMinYEdge);
    
    self.contentView = [[UIView alloc] initWithFrame: contentRect];
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    
    self.contentView.clipsToBounds = YES;
    
    [self.view addSubview: self.contentView];
    [self.view addSubview: accessoryView];
    
    self.contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    accessoryView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20.0, 85.0, 280.0, 40.0)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter a label";
    self.textField.delegate = self;
    [accessoryView addSubview:self.textField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Add a Cell" forState:UIControlStateNormal];
    [accessoryView addSubview:button];
    [button sizeToFit];
    button.frame = CGRectOffset(button.frame, 310.0, 90.0);
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 60, 200, 40)];
    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(40, 120, 200, 40)];
    
    [self.contentView addSubview:subview1];
    [self.contentView addSubview:subview2];
    
    subview1.text = @"Hello World! 🌍🌎🌏";
    subview2.text = @"Cool View Cells Rock! 🍾🥂";
    
    subview1.backgroundColor = UIColor.clearColor;
    subview2.backgroundColor = UIColor.orangeColor;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = touches.anyObject;
//    CGPoint currLocation = [touch locationInView:nil];
//    CGPoint prevLocation = [touch previousLocationInView:nil];
//
//    CGFloat dx = currLocation.x - prevLocation.x;
//
//    touch.view.frame = CGRectOffset(touch.view.frame, dx, 0);
//}

@end
