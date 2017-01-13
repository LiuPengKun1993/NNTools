//
//  UIButton+NNButton.h
//  YMWM
//
//  Created by iOS on 16/9/29.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (NNButton)

/**
 *  设置拉伸后的正常和高亮状态的按钮背影图片
 *
 *  @param normalBg    普通状态的背影图片
 *  @param highlighted 高亮状态的背影图片
 */

- (void)setResizedNormalBg:(NSString *)normalBg highlightedBg:(NSString *)highlightedBg;

- (void)setResizedNormalBg:(NSString *)normalBg highlightedBg:(NSString *)highlightedBg leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap;
/**
 *  设置未拉伸后的正常和高亮状态按钮背影图片
 *
 *  @param normalBg    普通状态的背影图片
 *  @param highlighted 高亮状态的背影图片
 */

- (void)setNormalBg:(NSString *)normalBg highlightedBg:(NSString *)highlightedBg;

/**
 *  设置未拉伸的正常状态背影图片
 */
- (void)setNormalBg:(NSString *)normalBg;

/**
 *  设置未拉伸的高亮状态背影图片
 */
- (void)setHighlightedBg:(NSString *)highlightedBg;


/**
 *  设置拉伸后的正常状态背影图片
 */
- (void)setResizedNormalBg:(NSString *)normalBg;

/**
 *  设置拉伸后的高亮状态背影图片
 *
 */
- (void)setResizedHighlightedBg:(NSString *)highlightedBg;


/**
 *  设置未拉伸的选中状态背影图片
 */
- (void)setSelectedBg:(NSString *)selectedBg;

/**
 *  设置拉伸的选中状态背影图片
 */
- (void)setResizedSelectedBg:(NSString *)selectedBg;

/**
 *  设置未拉伸的正常状态的Image
 */
- (void)setNormalImage:(NSString *)normalImage;


/**
 *  设置未拉伸的高亮状态的Image
 */
- (void)setHighlightedImage:(NSString *)highlightedImage;

/**
 *  设置未拉伸的普通和高亮状态的Image
 */

- (void)setNormalImage:(NSString *)normalImage highlightedImage:(NSString *)highlightedImage;



- (void)setNormalTitle:(NSString *)normalTitle;


- (void)setNormalTitleColor:(UIColor *)color;

@end
