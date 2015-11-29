//
//  ViewController.h
//  MetovaSearch
//
//  Created by kittiphong xayasane on 2015-11-25.
//  Copyright © 2015 Kittiphong Xayasane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultsViewController.h"

@interface ViewController : UIViewController

@property(nonatomic) NSDictionary *searchResults;
@property (strong, nonatomic) IBOutlet UITextField *textField;
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@end

