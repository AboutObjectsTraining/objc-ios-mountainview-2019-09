//
//  ReadingListTableViewController.m
//  ReadingList
//
//  Created by Van Simmons on 9/26/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import "ReadingListTableViewController.h"
#import "CLNCoolViewCell.h"

@interface ReadingListTableViewController ()

@property (nonatomic, strong) NSArray <NSArray <NSString *> *> *data;
@property (nonatomic, strong) NSArray <NSString *> *sections;


@end

@implementation ReadingListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sections = @[
                      @"Mysteries",
                      @"Literature",
                      @"Biographies",
                      @"Sci-Fi"
                      ];
    self.data = @[
                  @[
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report"
                      ],
                  @[
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot"
                      ],
                  @[
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot"],
                  @[
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report",
                      @"For Whom The Bell Tolls",
                      @"The Thread that Runs So True",
                      @"I, Robot",
                      @"The Muehler Report"
                      ]
                  ];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = indexPath.row % 2 ? @"Book" : @"Green Book";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.text = self.data[indexPath.section][indexPath.row];
    
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
