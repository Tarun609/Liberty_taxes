//
//  ViewController.m
//  BAAT
//
//  Created by Tarun on 17/03/16.
//  Copyright © 2016 Tarun. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import "AboutusViewController.h"
#import "ServicesViewController.h"
#import "ContactusViewController.h"
#import "CarrierViewController.h"

@interface ViewController ()
@property (nonatomic) CAPSPageMenu *pageMenu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self addToolbar];
    
    self.navigationController.navigationBarHidden=TRUE;
    
    UIView *topview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [topview setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:topview];

}


-(void)addToolbar
{
   // UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
   HomeViewController *homeview=[[HomeViewController alloc]init];
    homeview.title = @"Home";
   
    
    CarrierViewController *carrview=[[CarrierViewController alloc]init];
    carrview.title = @"Carriers";
    
    AboutusViewController *abtview=[[AboutusViewController alloc]init];
    abtview.title = @"About Us";
    
    ContactusViewController *cntctview=[[ContactusViewController alloc]init];
    cntctview.title = @"Contact Us";
    
    
    ServicesViewController *serviceview=[[ServicesViewController alloc]init];
    serviceview.title = @"Services";
    
    for (UIViewController *cntrl in self.navigationController.viewControllers) {
        if (cntrl == self) {
            homeview.homeTab=self;
            serviceview.homeTab=self;
            carrview.homeTab=self;
            abtview.homeTab=self;
            cntctview.homeTab=self;
            break;
        }
    }
    
    
    
    NSArray *controllerArray = @[homeview,abtview,serviceview,carrview,cntctview];
    NSDictionary *parameters ;
    
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        parameters = @{
                       CAPSPageMenuOptionScrollMenuBackgroundColor:[UIColor colorWithRed:0/255.0 green:199/255.0 blue:244/255.0 alpha:1],
                       CAPSPageMenuOptionViewBackgroundColor: [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0],
                       
                       CAPSPageMenuOptionSelectionIndicatorColor: [UIColor orangeColor],
                       CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor colorWithRed:70.0/255.0 green:70.0/255.0 blue:70.0/255.0 alpha:1.0],
                       CAPSPageMenuOptionMenuItemFont: [UIFont boldSystemFontOfSize:18.0],
                       CAPSPageMenuOptionUnselectedMenuItemLabelColor :[UIColor whiteColor],
                       CAPSPageMenuOptionMenuHeight: @(40.0),
                       CAPSPageMenuOptionMenuItemWidth: @(170.0),
                       CAPSPageMenuOptionCenterMenuItems: @(YES)
                       };
    }
    else
    {
        parameters = @{
                       CAPSPageMenuOptionScrollMenuBackgroundColor:[UIColor colorWithRed:0/255.0 green:199/255.0 blue:244/255.0 alpha:1],
                       //CAPSPageMenuOptionScrollMenuBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"best_header_bg.png"]],
                       CAPSPageMenuOptionViewBackgroundColor: [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0],
                       
                       CAPSPageMenuOptionSelectionIndicatorColor: [UIColor orangeColor],
                       CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor colorWithRed:70.0/255.0 green:70.0/255.0 blue:70.0/255.0 alpha:1.0],
                       CAPSPageMenuOptionMenuItemFont: [UIFont boldSystemFontOfSize:13.0],
                       CAPSPageMenuOptionUnselectedMenuItemLabelColor :[UIColor whiteColor],
                       CAPSPageMenuOptionMenuHeight: @(40.0),
                       CAPSPageMenuOptionMenuItemWidth: @(80.0),
                       CAPSPageMenuOptionCenterMenuItems: @(YES)
                       };
    }
    
    
    NSInteger x=130;
    
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0,64, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    [_pageMenu.view setBackgroundColor:[UIColor whiteColor]];
    

    

    [self.view addSubview:_pageMenu.view];
}



@end
