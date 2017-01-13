//
//  UIView+IBExtension.h
//  YMWM
//
//  Created by iOS on 15/12/6.
//  Copyright © 2015年 YMWM. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (IBExtension)

/// 边线颜色
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
/// 边线宽度
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
/// 脚半径
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@end
