//
//  MBProgressHUD+Extensions.h
//  HttpDemo
//
//  Created by 韩学鹏 on 15/7/9.
//  Copyright (c) 2015年 韩学鹏. All rights reserved.
//

#import "MBProgressHUD.h"

#define NoDelayTime -1

@interface MBProgressHUD (Extensions)

#pragma mark - 扩展提示信息框 自动隐藏
/**
 *  快速显示一个信息提示框
 *
 *  @param text     提示信息内容
 *  @param animated 是否有显示动画
 *  @param delay    自动消失时间
 */

+ (MB_INSTANCETYPE)showMessage:(NSString *)text animated:(BOOL)animated afterDelay:(NSTimeInterval)delay;
/**
 *  快速显示一个信息提示框
 *
 *  @param text     提示信息内容
 *  @param icon     显示的图标
 *  @param animated 是否有显示动画
 *  @param delay    自动消失时间
 */
+ (MB_INSTANCETYPE)showMessage:(NSString *)text icon:(NSString *)icon animated:(BOOL)animated afterDelay:(NSTimeInterval)delay;
/**
 *  快速显示一个信息提示框
 *
 *  @param text     提示信息内容
 *  @param icon     显示的图标
 *  @param view     提示框添加到得节点
 *  @param animated 是否有显示动画
 *  @param delay    自动消失时间
 */
+ (MB_INSTANCETYPE)showMessage:(NSString *)text icon:(NSString *)icon view:(UIView *)view animated:(BOOL)animated afterDelay:(NSTimeInterval)delay;

#pragma mark - 扩展提示信息框 手动隐藏
+ (MB_INSTANCETYPE)showMessage:(NSString *)text animated:(BOOL)animated;
+ (MB_INSTANCETYPE)showMessage:(NSString *)text icon:(NSString *)icon animated:(BOOL)animated;
+ (MB_INSTANCETYPE)showMessage:(NSString *)text icon:(NSString *)icon view:(UIView *)view animated:(BOOL)animated;
#pragma mark - 扩展隐藏信息提示框
/**
 *  隐藏信息提示框
 *
 *  @param view     信息提示框所在的节点
 *  @param animated 是否有隐藏动画
 */
+ (void)hideHUD:(UIView *)view animated:(BOOL)animated;
/**
 *  隐藏信息提示框
 *
 *  @param animated 是否有隐藏动画
 */
+ (void)hideHUD:(BOOL)animated;
@end
