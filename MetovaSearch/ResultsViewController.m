//
//  ResultsViewController.m
//  MetovaSearch
//
//  Created by kittiphong xayasane on 2015-11-26.
//  Copyright © 2015 Kittiphong Xayasane. All rights reserved.
//

#import "ResultsViewController.h"


@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchResultsArray = [[NSMutableArray alloc] init];
    //self.searchResultsArray = [self.searchResults allValues];
    self.searchResultsArray = [[NSMutableArray alloc] initWithArray:[self.searchResults allValues]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)testButton:(id)sender {
    NSLog(@"The dictionary is: %@", self.searchResults);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    
    NSLog(@"My data is: %@", self.searchResults);
    return [[self.searchResults valueForKeyPath:@"RelatedTopics.Text"] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Helllllo");
    
    static NSString *MyIdentifier = @"MyTableViewCell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }

    //int playerCount = lroundf([[[self.searchResultsArray objectAtIndex:indexPath.row] valueForKey:@"playercount"] floatValue]);
    
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%@", [[self.searchResults valueForKeyPath:@"RelatedTopics.Text"] objectAtIndex:indexPath.row]];
    
    NSLog(@"Text is: %@", [[self.searchResults valueForKeyPath:@"RelatedTopics.Text"] objectAtIndex:indexPath.row]);
    
    //cell.dateLabel.text = [[self.myObject objectAtIndex:indexPath.row] valueForKey:@"gametime"];
    //cell.playerLabel.text = [NSString stringWithFormat:@"Open Spots: %d", playerCount];
    
    
    //cell.timeLabel.text = [NSString stringWithFormat:@"%@", [[self.myObject objectAtIndex:indexPath.row] valueForKey:@"gametime"]];
    
    return cell;
}

@end
