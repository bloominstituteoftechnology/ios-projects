//
//  JKContactsTableViewController.m
//  ContactsMRC
//
//  Created by TuneUp Shop  on 3/7/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKContactsTableViewController.h"


@interface JKContactsTableViewController () {
    JKContactsController *sharedController;
}

//@property (nonatomic, retain, nonnull) JKContactsController *sharedController;


@end

@implementation JKContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    JKContactsController *sharedController = [JKContactsController sharedController];
//    @autoreleasepool {
//    _contactController = [[JKContactsController alloc] init];
//    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
     [[self tableView] reloadData];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sharedController.savedContacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
    
    // Configure the cell...
    JKContact *contact = [sharedController.savedContacts objectAtIndex:indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"AddContactView"]) {
        JKContactDetailViewController *destinationVC = [segue destinationViewController];
        //destinationVC.sharedController = sharedController;
    }else if ([segue.identifier isEqual:@"ContactDetailView"]) {
        JKContactDetailViewController *destinationVC = [segue destinationViewController];
        //destinationVC.sharedController = sharedController;
        NSIndexPath *selectedRow = self.tableView.indexPathForSelectedRow;
        NSInteger row = selectedRow.row;
        JKContact *contact = [sharedController.savedContacts objectAtIndex:row];
        destinationVC.contact = contact;
    }
}


@end
