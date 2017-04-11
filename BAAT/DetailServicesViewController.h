//
//  DetailServicesViewController.h
//  BAAT
//
//  Created by Tarun on 21/03/16.
//  Copyright © 2016 Tarun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface DetailServicesViewController : UIViewController<UIWebViewDelegate>
{
    MBProgressHUD *HUD,*HUDToast;
}

@property (strong, nonatomic) NSString *value;

@end
