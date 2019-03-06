//
//  LMSContactsTableViewController.m
//  Contacts MRC
//
//  Created by Lisa Sampson on 3/6/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSContactsTableViewController.h"
#import "LMSContact.h"
#import "LMSContactController.h"
#import "LMSContactViewController.h"

@interface LMSContactsTableViewController ()

@property LMSContactController *contactController;

@end

@implementation LMSContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contactController.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
    
    LMSContact *contact = _contactController.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phoneNumber;
    
    return cell;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LMSContactViewController *destinationVC = [segue destinationViewController];
    destinationVC.contactController = _contactController;
    destinationVC.segueIdentifier = segue.identifier;
    
    if ([segue.identifier isEqualToString:@"EditSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LMSContact *contact = _contactController.contacts[indexPath.row];
        destinationVC.contact = contact;
    }
}

@end
