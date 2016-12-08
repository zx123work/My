//
//  UIView+HUD.m
//  TRProject
//
//  Created by tarena on 2016/11/14.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "UIView+HUD.h"

@implementation UIView (HUD)
- (void)showHUD{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud hideAnimated:YES afterDelay:30];
}

- (void)hideHUD{
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
}
- (void)showMsg:(NSString *)msg{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:1.5];
}







@end
