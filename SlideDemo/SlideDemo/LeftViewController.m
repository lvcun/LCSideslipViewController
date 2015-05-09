//
//  LeftViewController.m
//  SlideDemo
//
//  Created by Hitao_lvcun on 15/5/9.
//  Copyright (c) 2015年 Hitao_lvcun. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 320, 50)];
    lable.text = @"我是左控制器";
    [self.view addSubview:lable];
}

@end
