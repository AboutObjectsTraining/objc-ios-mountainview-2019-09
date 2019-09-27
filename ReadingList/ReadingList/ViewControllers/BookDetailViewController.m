//
//  BookDetailViewController.m
//  ReadingList
//
//  Created by Van Simmons on 9/27/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import "BookDetailViewController.h"
#import "Author.h"

@interface BookDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;
@property (weak, nonatomic) IBOutlet UITextField *authorTextField;

@end

@implementation BookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleTextField.text = self.book.title;
    self.yearTextField.text = [self.book.year stringValue];
    self.authorTextField.text = self.book.author.fullName;
}

- (IBAction)save:(UIButton *)sender {
    self.book.title = self.titleTextField.text;
    self.updateBook(self.book);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
