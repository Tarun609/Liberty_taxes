//
//  AboutusViewController.m
//  BAAT
//
//  Created by Tarun on 17/03/16.
//  Copyright © 2016 Tarun. All rights reserved.
//

#import "AboutusViewController.h"

@interface AboutusViewController ()

@end

@implementation AboutusViewController
@synthesize homeTab;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    HUD.mode=MBProgressHUDModeIndeterminate;
    
    HUDToast = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUDToast];
    
    HUDToast.mode=MBProgressHUDModeText;

    
   UIWebView *imageWebView= [[UIWebView alloc] init];
    imageWebView.frame=CGRectMake(20,5,self.view.frame.size.width-30,self.view.frame.size.height-130);
    [imageWebView setBackgroundColor:[UIColor clearColor]];
    imageWebView.delegate = self;
    
    [imageWebView setOpaque:NO];
    [self.view addSubview:imageWebView];
    
    [imageWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Aboutus" ofType:@"html"]isDirectory:NO]]];
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
