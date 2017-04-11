//
//  HomeViewController.m
//  BAAT
//
//  Created by Tarun on 17/03/16.
//  Copyright © 2016 Tarun. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize homeTab;

UIWebView *imageWebView;

-(void)viewWillAppear:(BOOL)animated
{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    HUD.mode=MBProgressHUDModeIndeterminate;
    
    
    HUDToast = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUDToast];
    
    HUDToast.mode=MBProgressHUDModeText;
    
    
    [self ShowProgress];
    
    imageWebView= [[UIWebView alloc] init];
    imageWebView.frame=CGRectMake(20,5,self.view.frame.size.width-30,self.view.frame.size.height-130);
    [imageWebView setBackgroundColor:[UIColor clearColor]];
    imageWebView.delegate=self;
    [imageWebView setOpaque:NO];
    [self.view addSubview:imageWebView];
    
    [imageWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Home" ofType:@"html"]isDirectory:NO]]];
 
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden=TRUE;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
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
