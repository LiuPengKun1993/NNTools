//
//  UIButton+NNButton.m
//  YMWM
//
//  Created by iOS on 16/9/29.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "UIButton+NNButton.h"
#import "UIImage+NNImage.h"

@implementation UIButton (NNButton)

/**
 *  设置拉伸后的正常和高亮状态的按钮背影图片
 *
 *  @param normalBg    普通状态的背影图片
 *  @param highlighted 高亮状态的背影图片
 */
- (void)setResizedNormalBg:(NSString *)normalBg highlightedBg:(NSString *)highlightedBg {
    [self setResizedNormalBg:normalBg];
    [self setResizedHighlightedBg:highlightedBg];
}


- (void)setResizedNormalBg:(NSString *)normalBg highlightedBg:(NSString *)highlightedBg leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap {
    UIImage *normalImage = [UIImage resizedImageWithName:normalBg left:leftCap top:topCap];
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    UIImage *highlightedImage = [UIImage resizedImageWithName:highlightedBg left:leftCap top:topCap];
    [self setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
}


/**
 *  设置未拉伸后的正常和高亮状态按钮背影图片
 *
 *  @param normalBg    普通状态的背影图片
 *  @param highlighted 高亮状态的背影图片
 */
- (void)setNormalBg:(NSString *)normalBg highlightedBg:(NSString *)highlightedBg {
    [self setNormalBg:normalBg];
    [self setHighlightedBg:highlightedBg];
}


/**
 *  设置未拉伸的正常状态背影图片
 */
- (void)setNormalBg:(NSString *)normalBg {
    [self setBackgroundImage:[UIImage imageNamed:normalBg] forState:UIControlStateNormal];
}

/**
 *  设置未拉伸的高亮状态背影图片
 */
- (void)setHighlightedBg:(NSString *)highlightedBg {
    [self setBackgroundImage:[UIImage imageNamed:highlightedBg] forState:UIControlStateHighlighted];
}


/**
 *  设置拉伸后的正常状态背影图片
 */
- (void)setResizedNormalBg:(NSString *)normalBg {
    [self setBackgroundImage:[UIImage resizedImageWithName:normalBg] forState:UIControlStateNormal];
}


/**
 *  设置拉伸后的高亮状态背影图片
 *
 */
- (void)setResizedHighlightedBg:(NSString *)highlightedBg {
    [self setBackgroundImage:[UIImage resizedImageWithName:highlightedBg] forState:UIControlStateHighlighted];
}


/**
 *  设置未拉伸的选中状态背影图片
 */
- (void)setSelectedBg:(NSString *)selectedBg {
    [self setBackgroundImage:[UIImage imageNamed:selectedBg] forState:UIControlStateSelected];
}

/**
 *  设置拉伸后的选中状态背影图片
 */
- (void)setResizedSelectedBg:(NSString *)selectedBg {
    [self setBackgroundImage:[UIImage resizedImageWithName:selectedBg] forState:UIControlStateSelected];
}

/**
 *  设置未拉伸的正常状态的Image
 */
- (void)setNormalImage:(NSString *)normalImage {
    [self setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
}

/**
 *  设置未拉伸的高亮状态的Image
 */
- (void)setHighlightedImage:(NSString *)highlightedImage {
    [self setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
}

/**
 *  设置未拉伸的普通和高亮状态的Image
 */

- (void)setNormalImage:(NSString *)normalImage highlightedImage:(NSString *)highlightedImage {
    [self setNormalImage:normalImage];
    [self setHighlightedImage:highlightedImage];
}


- (void)setNormalTitle:(NSString *)normalTitle {
    [self setTitle:normalTitle forState:UIControlStateNormal];
}

- (void)setNormalTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateNormal];
}

@end
