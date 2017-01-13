//
//  NSDate+Extension.h
//  YMWM
//
//  Created by iOS on 15/10/11.
//  Copyright © 2015年 YMWM. All rights reserved.
//  判断时间日期

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

// 日期描述字符串
//     -   刚刚(一分钟内)
//     -   X分钟前(一小时内)
//     -   X小时前(当天)
//     -   昨天 HH:mm(昨天)
//     -   MM-dd HH:mm(一年内)
//     -   yyyy-MM-dd HH:mm(更早期)
- (NSString *)ff_dateDescription;

@end
