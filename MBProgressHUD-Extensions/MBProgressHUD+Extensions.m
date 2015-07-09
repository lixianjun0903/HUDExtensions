//
//  MBProgressHUD+Extensions.m
//  HttpDemo
//
//  Created by 韩学鹏 on 15/7/9.
//  Copyright (c) 2015年 韩学鹏. All rights reserved.
//

#import "MBProgressHUD+Extensions.h"

@implementation MBProgressHUD (Extensions)

#pragma mark - 扩展提示信息框 自动隐藏
+ (MB_INSTANCETYPE)showMessage:(NSString *)text animated:(BOOL)animated afterDelay:(NSTimeInterval)delay {
    return [self showMessage:text icon:nil animated:animated afterDelay:delay];
}


+ (MB_INSTANCETYPE)showMessage:(NSString *)text icon:(NSString *)icon animated:(BOOL)animated afterDelay:(NSTimeInterval)delay {
    return [self showMessage:text icon:icon view:nil animated:animated afterDelay:delay];
}


+ (MB_INSTANCETYPE)showMessage:(NSString *)text icon:(NSString *)icon view:(UIView *)view animated:(BOOL)animated afterDelay:(NSTimeInterval)delay {
    if (!view) {
        view = [UIApplication sharedApplication].windows.lastObject;
    }
    //创建一个信息提示框
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:animated];
    //设置提示信息
    hud.labelText = text;
    //设置显示的图标
    if (icon) {
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
        hud.mode = MBProgressHUDModeCustomView;  //自定义视图模式
    }else {
        hud.mode = MBProgressHUDModeText;  //只显示文字模式
    }
    
    //当信息框隐藏时从父节点上移除
    hud.removeFromSuperViewOnHide = YES;
    
    if (delay>=0) {
        //在指定的时间后自动消失
        [hud hide:YES afterDelay:delay];
    }
    
    return hud;
}

#pragma mark - 扩展提示信息框 手动隐藏

+ (MB_INSTANCETYPE)showMessage:(NSString *)text animated:(BOOL)animated {
    return [self showMessage:text icon:nil animated:animated];
}

+ (MB_INSTANCETYPE)showMessage:(NSString *)text icon:(NSString *)icon animated:(BOOL)animated {
    return [self showMessage:text icon:icon view:nil animated:animated];
}

+ (MB_INSTANCETYPE)showMessage:(NSString *)text icon:(NSString *)icon view:(UIView *)view animated:(BOOL)animated {
    return [self showMessage:text icon:icon view:view animated:animated afterDelay:NoDelayTime];
}

#pragma mark - 扩展隐藏信息提示框

+ (void)hideHUD:(UIView *)view animated:(BOOL)animated {
    if (!view) {
        view = [UIApplication sharedApplication].windows.lastObject;
    }
    [self hideHUDForView:view animated:animated];
}

+ (void)hideHUD:(BOOL)animated {
    [self hideHUD:nil animated:animated];
}

@end
