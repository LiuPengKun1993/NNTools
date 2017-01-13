//
//  UIViewController+NNExtension.m
//  YMWM
//
//  Created by iOS on 16/6/27.
//  Copyright © 2016年 YMWM. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "UIImage+NNImage.h"
#import <objc/runtime.h>
#import <objc/message.h>
// 设置颜色
#define NNColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define The_MainColor NNColor(51, 153, 255)

@implementation UIViewController (NNExtension)

+ (void)load {
    // 获取到UIViewController中presentViewController对应的method
    Method presentVC = class_getInstanceMethod(self, NSSelectorFromString(@"presentViewController:animated:completion:"));
    Method NN_presentVC = class_getInstanceMethod(self, @selector(NN_presentViewController:animated:completion:));
    
    // 将目标函数的原实现绑定到NNdd_presentViewController:animated:completion:方法上
    IMP presentVCImp = method_getImplementation(presentVC);
    class_addMethod(self, NSSelectorFromString(@"NNdd_presentViewController:animated:completion:"), presentVCImp, method_getTypeEncoding(presentVC));
    
    // 然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP NN_presentVCImp = method_getImplementation(NN_presentVC);
    class_replaceMethod(self, NSSelectorFromString(@"presentViewController:animated:completion:"), NN_presentVCImp, method_getTypeEncoding(presentVC));
    
    
    // 获取到UIViewController中dismissViewController对应的method
    Method dismissVC = class_getInstanceMethod(self, NSSelectorFromString(@"dismissViewControllerAnimated:completion:"));
    Method NN_dismissVC = class_getInstanceMethod(self, @selector(NN_dismissViewControllerAnimated:completion:));
    
    // 将目标函数的原实现绑定到NNdd_dismissViewControllerAnimated:completion:方法上
    IMP dismissVCImp = method_getImplementation(dismissVC);
    class_addMethod(self, NSSelectorFromString(@"NNdd_dismissViewControllerAnimated:completion:"), dismissVCImp, method_getTypeEncoding(dismissVC));
    
    // 然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP NN_dismissVCImp = method_getImplementation(NN_dismissVC);
    class_replaceMethod(self, NSSelectorFromString(@"dismissViewControllerAnimated:completion:"), NN_dismissVCImp, method_getTypeEncoding(dismissVC));
}

- (void)NN_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    typedef void (*NNMsgSend)(id, SEL, UIViewController *, BOOL, void (^)(void));
    NNMsgSend msgSend = (NNMsgSend)objc_msgSend;
    msgSend(self, NSSelectorFromString(@"NNdd_presentViewController:animated:completion:"), viewControllerToPresent, flag, completion);
    
    if (![viewControllerToPresent isKindOfClass:[UINavigationController class]]) {
        return;
    }
    UINavigationController *nav = (UINavigationController *)viewControllerToPresent;
    
    [nav.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 特殊处理没有安装新浪微博弹出的控制器
        if ([obj isKindOfClass:NSClassFromString(@"WBSDKComposerWebViewController")] || [obj isKindOfClass:NSClassFromString(@"CNContactPickerViewController")]) {
            // 通过appearance对象能修改整个项目中所有statusBar的样式
            UINavigationBar *appearance = [UINavigationBar appearance];
            // 设置导航条的背景
            [appearance setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
            // 设置文字
            NSMutableDictionary *att = [NSMutableDictionary dictionary];
            att[NSForegroundColorAttributeName] = [UIColor blackColor];
            [appearance setTitleTextAttributes:att];
            // 3.设置状态栏
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
            *stop = YES;
        }
    }];
}

- (void)NN_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    typedef void (*NNMsgSend)(id, SEL, BOOL, void (^)(void));
    NNMsgSend msgSend = (NNMsgSend)objc_msgSend;
    msgSend(self, NSSelectorFromString(@"NNdd_dismissViewControllerAnimated:completion:"), flag, completion);

    if ([self isKindOfClass:NSClassFromString(@"WBSDKComposerWebViewController")] || [self isKindOfClass:NSClassFromString(@"ABPeoplePickerNavigationController")]) {
        // 通过appearance对象能修改整个项目中所有statusBarStyle的样式
        UINavigationBar *appearance = [UINavigationBar appearance];
        // 1.设置导航条的背景
        [appearance setBackgroundImage:[UIImage createImageWithColor:The_MainColor] forBarMetrics:UIBarMetricsDefault];
        // 2.设置文字颜色
        NSMutableDictionary *att = [NSMutableDictionary dictionary];
        att[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [appearance setTitleTextAttributes:att];
        // 3.设置状态栏
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
}

@end
