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
    
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x267CB0);
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
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
    
    //Making url request
    NSString *string = [NSString stringWithFormat:@"http://api.duckduckgo.com/?q=%@&format=json", self.textField.text];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-javascript"];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON Retrieved: %@", self.searchResults);
        UIStoryboard * storyboard = self.storyboard;
        ResultsViewController *resultsVC = (ResultsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ResultsViewController"];
        resultsVC.searchResults = (NSDictionary *)responseObject;
        [self.navigationController pushViewController:resultsVC animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Search Results"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    [operation start];
}

@end
