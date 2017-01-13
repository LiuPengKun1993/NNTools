//
//  UIFont+Extension.m
//  YMWM
//
//  Created by iOS on 16/2/23.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "UIFont+Extension.h"
#define NNScreenH [UIScreen mainScreen].bounds.size.height
#define NNScreenW [UIScreen mainScreen].bounds.size.width

@implementation UIFont (Extension)
+ (UIFont *)fontWithDevice:(CGFloat)fontSize {
    if (NNScreenW > 375) {
        fontSize = fontSize + 3;
    }else if (NNScreenW == 375){
        fontSize = fontSize + 1.5;
    }else if (NNScreenW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

/**
 *  专门为客户性别，年龄电话写的
 */
+ (UIFont *)fontWithCustomer:(CGFloat)fontSize {
    if (NNScreenW > 375) {
        fontSize = fontSize + 2;
    }else if (NNScreenW == 375){
        fontSize = fontSize + 1.5;
    }else if (NNScreenW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

+ (UIFont *)navItemFontWithDevice:(CGFloat)fontSize {
    if (NNScreenW > 375) {
        fontSize = fontSize + 2;
    }else if (NNScreenW == 375){
        fontSize = fontSize + 1;
    }else if (NNScreenW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

+ (UIFont *)fontWithTwoLine:(CGFloat)fontSize {
    if (NNScreenW > 375) {
        fontSize = fontSize + 2;
    }else if (NNScreenW == 375){
        fontSize = fontSize + 1;
    }else if (NNScreenW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

+ (UIFont *)insuranceCellFont:(CGFloat)fontSize {
    if (NNScreenW > 375) {
        fontSize = fontSize + 3.5;
    }else if (NNScreenW == 375){
        fontSize = fontSize + 2;
    }else if (NNScreenW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

@end
