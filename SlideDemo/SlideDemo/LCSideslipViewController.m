//
//  LCSideslipViewController.m
//  SlideDemo
//
//  Created by lvcun on 15/5/9.
//  Copyright (c) 2015年 com.mobile.hitao. All rights reserved.
//

#import "LCSideslipViewController.h"

@interface LCSideslipViewController ()
@property (nonatomic,assign) CGFloat lastX;
@end

@implementation LCSideslipViewController
@synthesize speed,sideslipTapGes,isSwapToLeft;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(instancetype)initWithLeftView:(UIViewController *)leftView mainView:(UIViewController *)mainView rightView:(UIViewController *)righView isSwapeToLeft:(BOOL)isSwapeLeft backgroundImage:(UIImage *)image
{
    if(self){
        speed = 0.5;
        leftControl = leftView;
        mainControl = mainView;
        mainControl.view.userInteractionEnabled = YES;
        righControl = righView;
        
        UIImageView * imgview = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [imgview setImage:image];
        [self.view addSubview:imgview];
        self.isSwapToLeft = isSwapeLeft;
        //滑动手势
        if(self.isSwapToLeft == YES){
            UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
            [mainControl.view addGestureRecognizer:pan];
        }else{
            UISwipeGestureRecognizer * pan = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
            [mainControl.view addGestureRecognizer:pan];
        }
        //单击手势
        sideslipTapGes= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handeTap:)];
        [sideslipTapGes setNumberOfTapsRequired:1];
        
        [mainControl.view addGestureRecognizer:sideslipTapGes];
        
        leftControl.view.hidden = YES;
        righControl.view.hidden = YES;
        
        [self.view addSubview:leftControl.view];
        [self.view addSubview:righControl.view];
        [self.view addSubview:mainControl.view];
        
    }
    return self;
}



#pragma mark - 滑动手势

/**
 *  滑动手势
 */
- (void) handlePan: (UIGestureRecognizer *)rec{
    if (self.isSwapToLeft == YES) {//可左滑右滑
        UIPanGestureRecognizer * pan = (UIPanGestureRecognizer *)rec;
        CGPoint point = [pan translationInView:self.view];
        scalef = (point.x*speed+scalef);
        if (pan.view.frame.origin.x >= 0){
            pan.view.center = CGPointMake(pan.view.center.x + point.x*speed,pan.view.center.y);
            pan.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1-scalef/1000,1-scalef/1000);
            [pan setTranslation:CGPointMake(0, 0) inView:self.view];
            righControl.view.hidden = YES;
            leftControl.view.hidden = NO;
        }
        else
        {
            pan.view.center = CGPointMake(pan.view.center.x + point.x*speed,pan.view.center.y);
            pan.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1+scalef/1000,1+scalef/1000);
            [pan setTranslation:CGPointMake(0, 0) inView:self.view];
            righControl.view.hidden = NO;
            leftControl.view.hidden = YES;
        }
    }else{//只能向右滑动
        UISwipeGestureRecognizer * swipe = (UISwipeGestureRecognizer *)rec;
        CGPoint point = self.view.center;
        scalef = (point.x*speed+scalef);
        //根据视图位置判断是左滑还是右边滑动
        if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
            swipe.view.center = CGPointMake(swipe.view.center.x + point.x*speed,swipe.view.center.y);
            swipe.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1-scalef/1000,1-scalef/1000);
            righControl.view.hidden = YES;
            leftControl.view.hidden = NO;
        }
    }
    self.lastX = rec.view.frame.origin.x;
    //手势结束后修正位置
    if (rec.state == UIGestureRecognizerStateEnded) {
        if (scalef>140*speed){
            [self showLeftView];
        }
        else if (scalef<-140*speed) {
            [self showRighView];
        }
        else
        {
            [self showMainView];
            scalef = 0;
        }
    }

}

/**
 *  单击手势
 */
-(void)handeTap:(UITapGestureRecognizer *)tap{
    
    if (tap.state == UIGestureRecognizerStateEnded) {
        [UIView beginAnimations:nil context:nil];
        tap.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        tap.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
        [UIView commitAnimations];
        scalef = 0;
    }
    sideslipTapGes.enabled = NO;
}

/**
 *  回显
 */
-(void)showMainView{
    [UIView beginAnimations:nil context:nil];
    mainControl.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    mainControl.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
    [UIView commitAnimations];
    sideslipTapGes.enabled = NO;
}

/**
 *  显示左控制器
 */
-(void)showLeftView{
    [UIView beginAnimations:nil context:nil];
    mainControl.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
    mainControl.view.center = CGPointMake(340,[UIScreen mainScreen].bounds.size.height/2);
    [UIView commitAnimations];
    sideslipTapGes.enabled = YES;
}
/**
 *  显示右控制器
 */
-(void)showRighView{
    [UIView beginAnimations:nil context:nil];
    mainControl.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
    mainControl.view.center = CGPointMake(-60,[UIScreen mainScreen].bounds.size.height/2);
    [UIView commitAnimations];
    sideslipTapGes.enabled = YES;
}
@end
