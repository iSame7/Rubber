//
//  SecondViewController.h
//  Rubber
//
//  Created by sameh mabrouk on 5/17/14.
//  Copyright (c) 2014 smapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *data;
@end
