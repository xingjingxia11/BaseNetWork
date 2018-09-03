//
//  ViewController.m
//  InputPasswordDemo
//
//  Created by bailixi on 2017/11/3.
//  Copyright © 2017年 bluesky. All rights reserved.
//

#import "ViewController.h"
#import "JKPasswordView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<JKPasswordViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"安全设置";
    self.view.backgroundColor = [UIColor whiteColor];
    JKPasswordView *view = [[JKPasswordView alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH - 40, 45)];
    view.delegate = self;
    [self.view addSubview:view];
}

#pragma mark JKPasswordViewDelegate
- (void)transPwdText:(NSString *)text {
    NSLog(@"/////%@",text);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
