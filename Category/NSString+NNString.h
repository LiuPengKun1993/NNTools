//
//  NSString+NNString.h
//  YMWM
//
//  Created by iOS on 16/9/29.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NNString)

/**
 *  返回分与秒的字符串 如:01:60
 */
+ (NSString *)getMinuteSecondWithSecond:(NSTimeInterval)time;

@end
