//
//  MainViewController.m
//  Rubber
//
//  Created by sameh mabrouk on 5/17/14.
//  Copyright (c) 2014 smapps. All rights reserved.
//

#import "MainViewController.h"
#import "RubberTransition.h"
#import "CustomCell.h"
#import "SecondViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIImage *img = [UIImage imageNamed:@"iphone-BG"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    [imgView setImage:img];
    
    [self.tableView setBackgroundView:imgView];
    
    [self setTitle:@"Rubber"];
    self.data =
    @[
      @{@"text": @"Sameh Mabrouk", @"icon": @"samPic"},
      @{@"text": @"Create Post", @"icon": @"camera"},
      @{@"text": @"Edit Section", @"icon": @"pencil"},
      @{@"text": @"Settings", @"icon": @"beaker"}
      ];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setDelegate:self];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    return 100.0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell  *cell =(CustomCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        NSArray *topLevelObjects = [[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:nil options:nil];
        
        //common settings
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.indentationWidth = 44.0f;
        cell.indentationLevel = 1;
        cell.backgroundColor = [UIColor blackColor];
        
        for (id currentObject in topLevelObjects)
        {
            if ([currentObject isKindOfClass:[UITableViewCell class]]) {
                cell = (CustomCell*)currentObject;
                break;
            }
        }
    }
    
    NSDictionary* dict = self.data[indexPath.row];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    cell.cellTitle.text = dict[@"text"];
    [cell setBackgroundColor:[UIColor clearColor]];
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.row!=0) {
        cell.cellImagView.contentMode = UIViewContentModeCenter;
        
    }
    [cell.cellImagView setImage:[UIImage imageNamed:dict[@"icon"]]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController pushViewController:[[SecondViewController alloc] init] animated:YES];
}
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController*)fromVC
                                                 toViewController:(UIViewController*)toVC
{
    if (operation != UINavigationControllerOperationNone) {
        return [RubberTransition transitionWithOperation:operation];
    }
    return nil;
}

- (NSArray*)visibleCells
{
    return [self.tableView visibleCells];
}

@end
