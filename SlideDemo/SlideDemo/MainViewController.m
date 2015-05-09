//
//  MainViewController.m
//  SlideDemo
//
//  Created by Hitao_lvcun on 15/5/9.
//  Copyright (c) 2015年 Hitao_lvcun. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, 320, 50)];
    lable.text = @"我是主控制器，滑动我Please！";
    [self.view addSubview:lable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
