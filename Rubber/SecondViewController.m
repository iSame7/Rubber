//
//  SecondViewController.m
//  Rubber
//
//  Created by sameh mabrouk on 5/17/14.
//  Copyright (c) 2014 smapps. All rights reserved.
//

#import "SecondViewController.h"
#import "RubberTransition.h"
#import "CustomCell.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
      @{@"text": @"Shelfie", @"icon": @"ShelfieLogo"},
      @{@"text": @"ITI Intake 32 Java", @"icon": @"pencil"},
      @{@"text": @"Creative Design", @"icon": @"creativedesign"},
      @{@"text": @"Cuties", @"icon": @"cuties"},
      @{@"text": @"Java", @"icon": @"camera"},
      @{@"text": @"Paris", @"icon": @"Paris"},
    @{@"text": @"The 8 Hero", @"icon": @"beaker"},
      @{@"text": @"Childs Fashion", @"icon": @"Childs Fashion"}
      
      ];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setDelegate:self];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    return 60.0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
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
    
    
    cell.cellTitle.text = dict[@"text"];
    [cell setBackgroundColor:[UIColor clearColor]];
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.cellImagView setFrame:CGRectMake(15, 10, 40, 40)];
    [cell.cellImagView setImage:[UIImage imageNamed:dict[@"icon"]]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
  
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
