//
//  UIApplication+Extensions.h
//  YMWM
//
//  Created by iOS on 15/12/8.
//  Copyright © 2015年 YMWM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface UIApplication (Extensions)

/**
* 返回应用程序代理
*/
+ (AppDelegate *)appDelegate;


/**
 *  根视图控制器
 */
+ (UIViewController *)rootViewController;

/**
 *  返回当前设备对应的启动图片
 */
+ (UIImage *)launchImage;

@end
