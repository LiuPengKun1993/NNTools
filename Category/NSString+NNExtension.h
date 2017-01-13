//
//  NSString+NNExtension.h
//  YMWM
//
//  Created by iOS on 16/2/23.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (NNExtension)

/**
 *手机号码验证 MODIFIED BY HELENSONG
 */
- (BOOL) isValidateMobile;
///**
// *身份证验证
// */
//- (BOOL)validateIdentityCard;
/**
 * 判断字段是否包含空格
 */
- (BOOL)validateContainsSpace;

/**
 *  根据生日返回年龄
 */
- (NSString *)ageFromBirthday;

/**
 *  根据身份证返回岁数
 */
- (NSString *)ageFromIDCard;

/**
 *  根据身份证返回生日
 */
- (NSString *)birthdayFromIDCard;

/**
 *  根据身份证返回性别
 */
- (NSString *)sexFromIDCard;

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  将数字转换成英文计数的方式
 */
+ (NSString *)stringWithMoneyAmount:(double)amount;

/**
 *  将数字转换成xx万
 */
+ (NSString *)stringWithMoneyAmountInChinese:(double)amount;

+ (NSString *)stringIntervalFrom:(NSDate *)start to:(NSDate *)end;

//邮箱
+ (BOOL)validateEmail:(NSString *)email;

- (BOOL)isEmptyString;

// 隐藏信息
- (NSString *)hideInformation;

@end
