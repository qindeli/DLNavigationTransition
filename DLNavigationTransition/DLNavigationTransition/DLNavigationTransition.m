//
//  DLNavigationTransition.m
//  DLRightPanGestureBack
//
//  Created by vera on 16/5/16.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "DLNavigationTransition.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@interface UINavigationController (Transition)<UIGestureRecognizerDelegate>

- (void)transitionPanGestureDidLoad;

@end

@interface DLNavigationTransition ()

@end

@implementation DLNavigationTransition

/**
 *  启动右滑pop
 */
+ (void)enableNavigationTransitionWithPanGestureBack
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method viewDidLoadMethod = class_getInstanceMethod([UINavigationController class], @selector(viewDidLoad));
        Method transitionPanGestureDidLoadMethod = class_getInstanceMethod([UINavigationController class], @selector(transitionPanGestureDidLoad));
        
        method_exchangeImplementations(viewDidLoadMethod, transitionPanGestureDidLoadMethod);
        
    });
}

@end


@implementation UINavigationController (Transition)

- (void)transitionPanGestureDidLoad
{    
    if ([self isKindOfClass:[UINavigationController class]])
    {
        
        [self transitionPanGestureDidLoad];

        
        //1.获取系统interactivePopGestureRecognizer对象的target对象
        id target = self.interactivePopGestureRecognizer.delegate;
        
        
        //2.创建滑动手势，taregt设置interactivePopGestureRecognizer的target，所以当界面滑动的时候就会自动调用target的action方法。handleNavigationTransition是私有类_UINavigationInteractiveTransition的方法，系统主要在这个方法里面实现动画的。
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
        //3.设置代理
        pan.delegate = self;
        //4.添加到导航控制器的视图上
        [self.view addGestureRecognizer:pan];
        
        //5.禁用系统的滑动手势
        self.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)handleNavigationTransition:(UIPanGestureRecognizer *)pan
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - 滑动开始会触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //只有导航的根控制器不需要右滑的返回的功能。
    if (self.viewControllers.count <= 1)
    {
        
        return NO;
    }
    
    return YES;
}

@end
