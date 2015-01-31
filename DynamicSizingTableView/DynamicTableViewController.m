//
//  DynamicTableViewController.m
//  DynamicSizingTableView
//
//  Created by Catalin (iMac) on 23/01/2015.
//  Copyright (c) 2015 Tapsarena. All rights reserved.
//

#import "DynamicTableViewController.h"

@interface DynamicTableViewController ()

@property (nonatomic, strong) NSArray *textToDisplay;

@end

@implementation DynamicTableViewController

static UIImage *stockImage;

#pragma mark - View controller methods

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textToDisplay = @[@"Lorem ipsum dolor sit amet, paulo quodsi no quo, porro fugit nec ut.",
                           @"Ut vix expetendis quaerendum consequuntur, prompta dissentiet at sit. Summo sensibus mea ex.",
                           @"Albucius partiendo eos ut, et brute essent eleifend mel.",
                           @"Mel liber possit meliore in. An wisi maiestatis incorrupte quo, ut etiam partiendo cum. Vel cu cibo dicunt volutpat. Utroque contentiones et nec. No mea option timeam necessitatibus.",
                           @"Sumo apeirian ne pro, vix id fierent offendit, cum cu inani corrumpit voluptaria."];
    
    // Increase the gap from the status bar to the top of the table view
    self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
    
    // Enable the self-sizing table view cells
    self.tableView.estimatedRowHeight = 88.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    // Initialize the feature image
    stockImage = [UIImage imageNamed:@"image.png"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Force the data reload on first display to trigger the cell height calculation
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return self.textToDisplay.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The cell is created or dequeued by the table view
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dynamic cell" forIndexPath:indexPath];

    // Initialize the cell with the text content
    cell.textLabel.text = self.textToDisplay[indexPath.row];
    
    // The label should be multi-line to be able to display the text entirely
    cell.textLabel.numberOfLines = 0;
    
    return cell;
}


@end
