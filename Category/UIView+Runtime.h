//
//  UIView+Runtime.h
//  YMWM
//
//  Created by iOS on 15/12/12.
//  Copyright © 2015年 YMWM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Runtime)

/// 查找子视图会保存
///
/// @param view      要查找的视图
/// @param clazzName 子控件类名
///
/// @return 找到的第一个子视图
+ (UIView *)ff_firstInView:(UIView *)view clazzName:(NSString *)clazzName;

/// TODO: 可以抽取到 NSObject 分类中国年
/// 遍历当前视图的成员变量 - 仅供测试使用
- (void)ff_ivarsList;
// 提示，此处打断点，在控制台输入 po [self.pageControl ff_ivarsList] 可以查看所有成员变量

/**
 *  打印所有子控件的Class
 *
 *  @param view 需要打印的View
 */
+ (void)logSubviewsClass:(UIView *)view;


/// 查找子视图且不会保存
///
/// @param view      要查找的视图
/// @param clazzName 子控件类名
///
/// @return 找到的第一个子视图
+ (UIView *)ff_foundViewInView:(UIView *)view clazzName:(NSString *)clazzName;
@end
