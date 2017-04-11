//
//  DetailServicesViewController.m
//  BAAT
//
//  Created by Tarun on 21/03/16.
//  Copyright © 2016 Tarun. All rights reserved.
//

#import "DetailServicesViewController.h"

@interface DetailServicesViewController ()

@end

@implementation DetailServicesViewController
@synthesize value;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.navigationController.navigationBarHidden=FALSE;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    HUD.mode=MBProgressHUDModeIndeterminate;
    
    HUDToast = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUDToast];
    
    HUDToast.mode=MBProgressHUDModeText;
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
        UIWebView *imageWebView= [[UIWebView alloc] init];
    imageWebView.frame=CGRectMake(0,64,self.view.frame.size.width,self.view.frame.size.height-64);
    [imageWebView setBackgroundColor:[UIColor whiteColor]];
    imageWebView.delegate = self;
    
    [imageWebView setOpaque:NO];
    [self.view addSubview:imageWebView];
    
    if([value isEqualToString:@"1"])
    {
        [imageWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Tax" ofType:@"html"]isDirectory:NO]]];
    }
    else  if([value isEqualToString:@"2"])
    {
        [imageWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Payroll" ofType:@"html"]isDirectory:NO]]];
    }
    else if([value isEqualToString:@"3"])
    {
        [imageWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Accounting" ofType:@"html"]isDirectory:NO]]];
    }
    else
    {
        [imageWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Business" ofType:@"html"]isDirectory:NO]]];
    }
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [self ShowProgress];
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self removeProgress];
    //Stop or remove progressbar
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self removeProgress];
    //Stop or remove progressbar and show error
}


#pragma mark-
#pragma mark-PROGRESS INDICATOR
-(void)showToast:(NSString *)msgString
{
    
    [HUDToast show:YES];
    HUDToast.labelText = msgString;
    [self performSelector:@selector(removeToast) withObject:nil afterDelay:2.0];
}

-(void)removeToast
{
    [HUDToast hide:YES];
    
}

-(void)removeProgress
{
    [HUD hide:YES];
}
-(void)ShowProgress
{
    [HUD show:YES];
}


@end
