//
//  ViewController.m
//  MetovaSearch
//
//  Created by kittiphong xayasane on 2015-11-25.
//  Copyright © 2015 Kittiphong Xayasane. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "ResultsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showDetailSegue"]){
        ResultsViewController *controller = (ResultsViewController *)segue.destinationViewController;
        controller.searchResults = self.searchResults;
    }
}

 
- (IBAction)submitButtonAction:(id)sender {
    // 1
    NSString *string = [NSString stringWithFormat:@"http://api.duckduckgo.com/?q=DuckDuckGo&format=json"];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-javascript"];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 3
        //self.searchResults = (NSDictionary *)responseObject;
        NSLog(@"JSON Retrieved: %@", self.searchResults);
        UIStoryboard * storyboard = self.storyboard;
        //NSString * storyboardName = [storyboard valueForKey:@"name"];
        //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        ResultsViewController *resultsVC = (ResultsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ResultsViewController"];
        resultsVC.searchResults = (NSDictionary *)responseObject;
        [self.navigationController pushViewController:resultsVC animated:YES];
        //[self presentModalViewController:resultsVC animated:YES];
        //[self performSegueWithIdentifier:@"showDetailSegue" sender:self];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Search Results"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];
}

@end
