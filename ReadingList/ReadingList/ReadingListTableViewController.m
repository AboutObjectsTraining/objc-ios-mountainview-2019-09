//
//  ReadingListTableViewController.m
//  ReadingList
//
//  Created by Van Simmons on 9/26/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import "ReadingListTableViewController.h"
#import "BookDetailViewController.h"
#import "CLNCoolViewCell.h"
#import "PictureTableViewCell.h"
#import "Book.h"
#import "Author.h"

@interface ReadingListTableViewController ()

@property (nonatomic, strong) NSMutableArray <NSMutableArray <Book *> *> *data;
@property (nonatomic, strong) NSArray <NSString *> *sections;


@end

@implementation ReadingListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sections = @[@"Literature"];
    self.data = @[[Book readingList].mutableCopy].mutableCopy;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CLNCoolViewCell * cell = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 52.0)];
    cell.text = self.sections[section];
    cell.backgroundColor = UIColor.purpleColor;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.sections[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data[section].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row % 3 == 2 ? 88.0 : 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"Book";
    switch (indexPath.row % 3) {
        case 0:
            identifier = @"Book";
            break;
        case 1:
            identifier = @"Green Book";
            break;
        case 2:
            identifier = @"Picture";
            break;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (indexPath.row % 3 != 2) {
        cell.textLabel.text = self.data[indexPath.section][indexPath.row].title;
        cell.detailTextLabel.text = self.data[indexPath.section][indexPath.row].author.fullName;
    } else {
        PictureTableViewCell *pic = (PictureTableViewCell*)cell;
        pic.label.text = self.data[indexPath.section][indexPath.row].title;
        pic.author.text = self.data[indexPath.section][indexPath.row].author.fullName;
        pic.image.image = [UIImage imageNamed:@"rvs"];
    }

    return cell;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView
                  editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *delete =
    [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
                                       title:@"Delete"
                                     handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.data[indexPath.section] removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }];
    return @[delete];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *dest = segue.destinationViewController;
    if ([dest isKindOfClass:[BookDetailViewController class]]) {
        BookDetailViewController *bookDetailVC = (BookDetailViewController*) dest;
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        Book *book = self.data[path.section][path.row];
        bookDetailVC.book = book;
        [bookDetailVC setUpdateBook:^(Book * _Nonnull book) {
            self.data[path.section][path.row] = book;
            [self.tableView reloadData];
        }];
    }
}

@end
