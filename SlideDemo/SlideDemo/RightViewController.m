//
//  RightViewController.m
//  SlideDemo
//
//  Created by Hitao_lvcun on 15/5/9.
//  Copyright (c) 2015年 Hitao_lvcun. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(200, 100, 320, 50)];
    lable.text = @"我是右控制器";
    [self.view addSubview:lable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
