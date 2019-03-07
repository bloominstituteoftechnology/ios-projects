//
//  OSISongTableViewController.m
//  Sprint11
//
//  Created by Sergey Osipyan on 3/1/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSIContactTableViewController.h"
#import "OSIContactController.h"
#import "OSIContact.h"
#import "OSIContactDetailViewController.h"

@interface OSIContactTableViewController ()
- (IBAction)addButton:(id)sender;
@property (retain) OSIContactController *osiContactController;
@end

@implementation OSIContactTableViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        _osiContactController = [[OSIContactController alloc] init];
        //[_osiContactController autorelease];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        _osiContactController = [[OSIContactController alloc] init];
       // [_osiContactController autorelease];
    }
    return self;
}


- (void)addButton:(id)sender {
    
}

static NSString * const reuseIdentifier = @"contactCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self tableView] reloadData];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

    
    
//#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [[_osiContactController contacts] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    OSIContact *contact = [[_osiContactController contacts] objectAtIndex:indexPath.row];
    cell.textLabel.text = contact.firstName;
    cell.detailTextLabel.text = contact.lastName;
  
    
    return cell;
}




// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       
        OSIContact *contact = [self.osiContactController.contacts objectAtIndex:indexPath.row];
        [self.osiContactController.contacts removeObject:contact];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    OSIContactDetailViewController * destination = segue.destinationViewController;
    destination.osiContactController = self.osiContactController;
    if ([segue.identifier  isEqual: @"showCell"]) {
        
        destination.conatct = [[self.osiContactController contacts] objectAtIndex:indexPath.row];
    }
}

- (void)dealloc
{
    [_osiContactController release];
    [super dealloc];
}

@end
