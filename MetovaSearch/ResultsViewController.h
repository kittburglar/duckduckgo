//
//  ResultsViewController.h
//  MetovaSearch
//
//  Created by kittiphong xayasane on 2015-11-26.
//  Copyright © 2015 Kittiphong Xayasane. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ResultsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *resultTableView;
@property(nonatomic,strong) NSDictionary *searchResults;
@property(nonatomic,strong) NSMutableArray *searchResultsArray;

@end
