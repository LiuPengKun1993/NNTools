//
//  NSDate+NNDate.h
//  YMWM
//
//  Created by iOS on 16/4/29.
//  Copyright © 2016年 YMWM. All rights reserved.
//  判断时间日期

#import <Foundation/Foundation.h>


// extern 常用于定义常量 其常量本身的内容在其它位置定义
extern NSString *const DateFormatyyyyMMddHHmmss;//年月日时分秒
extern NSString *const DateFormatMMddHHmmss;//月日时分秒
extern NSString *const DateFormatHHmmss;//时分秒

@interface NSDate (NNDate)
/**
 *  返回格式式后的字符串 如果201401011212（年月时分秒）
 */
+ (NSString *)nowDateFormat:(NSString *)format;




/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 * 是否为今年
 */
- (BOOL)isThisYear;

/**
 * 是否为今天
 */
- (BOOL)isToday;

/**
 * 是否为昨天
 */
- (BOOL)isYesterday;

@end
