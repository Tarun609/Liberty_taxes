//
//  CarrierViewController.h
//  BAAT
//
//  Created by Tarun on 17/03/16.
//  Copyright © 2016 Tarun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface CarrierViewController : UIViewController<UIWebViewDelegate>
{
    MBProgressHUD *HUD,*HUDToast;
}
@property (strong, nonatomic) UIViewController *homeTab;
@end
