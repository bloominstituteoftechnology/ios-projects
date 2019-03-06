//
//  ContactsTableViewController.m
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHContactsTableViewController.h"
#import "BHDetailedViewController.h"
#import "BHContactsController.h"
#import "BHContact.h"

@interface BHContactsTableViewController ()

@property BHContactsController *shared;

@end

@implementation BHContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _shared = [BHContactsController shared];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _shared.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
    
    // Configure the cell...
    BHContact *contact = _shared.contacts[indexPath.row];
    
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.email;
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    BHDetailedViewController *destVC = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    BHContact *contact = _shared.contacts[indexPath.row];
    
    destVC.contact = contact;
    
    if([segue.identifier  isEqual: @"AddNewContactSegue"]){
        // do something
        
        [destVC setIsUpdatingView: NO];
        
    } else if ([segue.identifier  isEqual: @"ViewExistingContactSegue"]){
        // do something else
        destVC.isUpdatingView = @YES;
        
    }
    
    
}

#pragma mark - Properties



@end
