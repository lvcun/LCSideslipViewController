
//
//  HTSideslipViewController.h
//  SlideDemo
//
//  Created by lvcun on 15/5/9.
//  Copyright (c) 2015年 com.mobile.hitao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSideslipViewController : UIViewController{
@private
    UIViewController * leftControl;
    UIViewController * mainControl;
    UIViewController * righControl;
    
    UIImageView * imgBackground;
    
    CGFloat scalef;
}


/**
 *  滑动速度系数,默认为0.5
 */
@property (assign,nonatomic) CGFloat speed;

/**
 *  是否允许点击视图恢复视图位置。默认为YES
 */
@property (strong) UITapGestureRecognizer *sideslipTapGes;
/**
 *  是否支持左滑
 */
@property(nonatomic,assign) BOOL isSwapToLeft;

//初始化
-(instancetype)initWithLeftView:(UIViewController *)leftView
                    mainView:(UIViewController *)mainView
                   rightView:(UIViewController *)righView
                  isSwapeToLeft:(BOOL) isSwapeLeft
                    backgroundImage:(UIImage *)image;


//回显
-(void)showMainView;

//显示左视图
-(void)showLeftView;

//显示右视图
-(void)showRighView;



@end
