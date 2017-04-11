//
//  ServicesViewController.m
//  BAAT
//
//  Created by Tarun on 17/03/16.
//  Copyright © 2016 Tarun. All rights reserved.
//

#import "ServicesViewController.h"
#import "DetailServicesViewController.h"

@interface ServicesViewController ()

@end

@implementation ServicesViewController
@synthesize homeTab;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for( int i = 1; i < 5; i++ ) {
        UIButton* aButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [aButton setFrame:CGRectMake(40, 25*i*2, self.view.frame.size.width-100,25)];
        [aButton setTag:i];
        [aButton setBackgroundColor:[UIColor lightGrayColor]];
        if(i==1)
           [aButton setTitle:@"Tax Services" forState:UIControlStateNormal];
        else if(i==2)
           [aButton setTitle:@"Payroll Services" forState:UIControlStateNormal];
        else if(i==3)
            [aButton setTitle:@"Accounting Services" forState:UIControlStateNormal];
        else
               [aButton setTitle:@"Business Consulting Service" forState:UIControlStateNormal];
        [aButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:aButton];
    }
    
}


- (void)buttonClicked:(UIButton*)button
{
    NSLog(@"Button %ld clicked.", (long int)[button tag]);
    
    DetailServicesViewController *carrview=[[DetailServicesViewController alloc]init];
    carrview.value=[NSString stringWithFormat:@"%ld",(long int)[button tag]];
    [homeTab.navigationController pushViewController:carrview animated:TRUE];
}



@end
