//
//  JKContactsTableViewController.m
//  ContactsMRC
//
//  Created by TuneUp Shop  on 3/7/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKContactsTableViewController.h"


@interface JKContactsTableViewController () 

@property (nonatomic, retain, nonnull) JKContactsController *contactController;


@end

@implementation JKContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @autoreleasepool {
    _contactController = [[JKContactsController alloc] init];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [[self tableView] reloadData];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactController.savedContacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
    
    // Configure the cell...
    JKContact *contact = [self.contactController.savedContacts objectAtIndex:indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"AddContactView"]) {
        JKContactDetailViewController *destinationVC = [segue destinationViewController];
        destinationVC.contactController = self.contactController;
    }else if ([segue.identifier isEqual:@"ContactDetailView"]) {
        JKContactDetailViewController *destinationVC = [segue destinationViewController];
        destinationVC.contactController = self.contactController;
        NSIndexPath *selectedRow = self.tableView.indexPathForSelectedRow;
        NSInteger row = selectedRow.row;
        JKContact *contact = [self.contactController.savedContacts objectAtIndex:row];
        destinationVC.contact = contact;
    }
}


@end
