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
    //[self removeNulls];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)removeNulls{
    NSMutableArray *result = [NSMutableArray array];
    
    for (int i = 0; i < [self.searchResults count]; i++) {
        if ([[NSString stringWithFormat:@"%@", [[self.searchResults valueForKeyPath:@"RelatedTopics.Text"] objectAtIndex:i]] isEqualToString: @"<null>"]) {
            [result addObject:[[self.searchResults valueForKeyPath:@"RelatedTopics.Text"] objectAtIndex:i]];
        }
    }
    NSLog(@"the log is: %@", result);
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
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Helllllo");
    
    static NSString *MyIdentifier = @"MyTableViewCell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }

    //int playerCount = lroundf([[[self.searchResultsArray objectAtIndex:indexPath.row] valueForKey:@"playercount"] floatValue]);
    if (![[NSString stringWithFormat:@"%@", [[self.searchResults valueForKeyPath:@"RelatedTopics.Text"] objectAtIndex:indexPath.row]] isEqualToString: @"<null>"] && ![[NSString stringWithFormat:@"%@", [[self.searchResults valueForKeyPath:@"RelatedTopics.FirstURL"] objectAtIndex:indexPath.row]] isEqualToString: @"<null>"]){
        
        cell.titleLabel.text = [NSString stringWithFormat:@"%@", [[self.searchResults valueForKeyPath:@"RelatedTopics.Text"] objectAtIndex:indexPath.row]];
        cell.urlLabel.text = [NSString stringWithFormat:@"%@", [[self.searchResults valueForKeyPath:@"RelatedTopics.FirstURL"] objectAtIndex:indexPath.row]];
    }
    else{
        cell.titleLabel.text = @"";
        cell.urlLabel.text = @"";
    }
    
    NSLog(@"Text is: %@", [[self.searchResults valueForKeyPath:@"RelatedTopics.Text"] objectAtIndex:indexPath.row]);
    
    /*
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [NSString stringWithFormat:@"%@", [[self.searchResults valueForKeyPath:@"RelatedTopics.Icon.URL"] objectAtIndex:indexPath.row]]]];
    //NSLog(@"image data is: ")
    //if ([NSString stringWithFormat:@"%@", [[self.searchResults valueForKeyPath:@"RelatedTopics.Icon.URL"] objectAtIndex:indexPath.row]].length > 0) {
        NSLog(@"image data exists");
        cell.imageView.image = [UIImage imageWithData: imageData];
     */
    //}
    /*
    else{
        NSLog(@"no image data exists");
        CGRect newFrame;
        newFrame.size.width = 0;
        newFrame.size.height = 0;
        [cell.imageView setBounds:newFrame];
    }
    */
    
    
    
    //cell.dateLabel.text = [[self.myObject objectAtIndex:indexPath.row] valueForKey:@"gametime"];
    //cell.playerLabel.text = [NSString stringWithFormat:@"Open Spots: %d", playerCount];
    
    
    //cell.timeLabel.text = [NSString stringWithFormat:@"%@", [[self.myObject objectAtIndex:indexPath.row] valueForKey:@"gametime"]];
    
    return cell;
}

@end
