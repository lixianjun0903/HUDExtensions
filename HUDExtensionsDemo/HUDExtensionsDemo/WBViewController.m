//
//  WBViewController.m
//  HttpDemo
//
//  Created by 韩学鹏 on 15/6/29.
//  Copyright (c) 2015年 韩学鹏. All rights reserved.
//

#import "WBViewController.h"
#import "MBProgressHUD+Extensions.h"

@interface WBViewController () <NSURLConnectionDataDelegate>
@end

@implementation WBViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    // Do any additional setup after loading the view.
    //显示需要手动隐藏的信息框
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [sendBtn setTitle:@"显示需要手动隐藏的信息框" forState:UIControlStateNormal];
    sendBtn.frame = CGRectMake(80, 90, 180, 25);
    [sendBtn addTarget:self action:@selector(btnFunc0) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBtn];
    
    //显示自动隐藏的信息框
    UIButton *sendBtn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [sendBtn1 setTitle:@"显示自动隐藏的信息框" forState:UIControlStateNormal];
    sendBtn1.frame = CGRectMake(100, 150, 150, 25);
    [sendBtn1 addTarget:self action:@selector(btnFunc1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBtn1];
    
    //显示带自定义图片的信息框
    UIButton *sendBtn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [sendBtn2 setTitle:@"显示带自定义图片的信息框" forState:UIControlStateNormal];
    sendBtn2.frame = CGRectMake(80, 210, 180, 25);
    [sendBtn2 addTarget:self action:@selector(btnFunc2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBtn2];
}

/**
 *  显示需要手动隐藏的信息框
 */
- (void)btnFunc0 {
    //显示一个加载框
    MBProgressHUD *hud = [MBProgressHUD showMessage:@"提示信息" animated:YES];
    hud.dimBackground = YES;   //显示暗色背景

    //发送HTTP请求
    NSString *str = @"http://www.weather.com.cn/adat/sk/101010100.html";
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        UIView *view = [UIApplication sharedApplication].windows.lastObject;
        [MBProgressHUD hideHUDForView:view animated:YES];
    }];
    
}

/**
 *  显示自动隐藏的信息框
 */
- (void)btnFunc1 {
    [MBProgressHUD showMessage:@"提示信息" animated:YES afterDelay:2];
    
}

/**
 *  显示带自定义图片的信息框
 */
- (void)btnFunc2 {
    [MBProgressHUD showMessage:@"提示信息" icon:@"error" animated:YES afterDelay:2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
