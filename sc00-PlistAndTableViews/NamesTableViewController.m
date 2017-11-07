//
//  NamesTableViewController.m
//  sc00-PlistAndTableViews
//
//  Created by user on 11/6/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "NamesTableViewController.h"

@interface NamesTableViewController ()
@property (nonatomic, strong) NSDictionary * names;
@property (nonatomic, strong) NSArray * keys;
@end

@implementation NamesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // get the path to the pList from the bundle
    NSString * path  = [[NSBundle mainBundle]pathForResource:@"USStates" ofType:@"plist"];
    
    //grab the content of the pList and save it to names
    self.names = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //each key is going to be a section
    self.keys = [[self.names allKeys] sortedArrayUsingSelector:@selector(compare:)];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    //return number of sections
    return [self.keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString * key = self.keys[section];
    
    NSArray * keyValues = self.names[key];
    return [keyValues count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellIdentifier = @"nameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString * key = self.keys[indexPath.section];
    NSArray * keyValues = self.names[key];
    
    cell.textLabel.text = [[keyValues objectAtIndex:indexPath.row] objectForKey:@"stateName"];
    return cell;
}

- (NSArray *) sectionIndexTitlesForTableView:(UITableView *) tableView{
    return self.keys;
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
