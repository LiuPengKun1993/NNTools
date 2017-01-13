//
//  NNCommonClass.h
//  NNCommonMethods
//
//  Created by 刘朋坤 on 17/1/12.
//  Copyright © 2017年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NNCommonClass : NSObject


#pragma mark - 验证类的方法
/**
 *  检查版本更新
 *  @return 整形
 */
+ (int)checkOSVersion;

/**
 *  判断是否是第一次加载
 *  @return BOOL
 */
+ (BOOL)isFirstLaunch;

/**
 * 验证输入是否是数字
 * @param number 传入的数据
 * @return 返回的数据
 */
+ (BOOL)validNumber:(NSString*)number;

/**
 * 验证纯中文
 */
+ (BOOL)validateChineseWordString:(NSString *)str;

/**
 * 验证字母数字下划线混合
 */
+ (BOOL)validateMixedWordString:(NSString *)str;

/**
 *  判断是否有空字符串
 */
+ (BOOL)isNullString:(NSString *)str;

/**
 *  银行卡号校验
 */
+ (BOOL)isBankCardluhmCheck:(NSString *)bankNumber;

/**
 *  验证手机号是否合法
 */
+ (BOOL)isValidateMobile:(NSString *)mobile;

/**
 *  验证身份证
 */
+ (BOOL)isValidateIDCardNumber:(NSString *)value;

/**
 *  根据身份证号获取性别
 */
+ (NSString *)getIdentityCardSex:(NSString *)numberStr;

/**
 *  根据身份证获取年龄
 */
+ (NSString *)getIdentityCardAge:(NSString *)numberStr;



#pragma mark - 正则匹配
/**
 * 正则匹配邮箱号
 */
+ (BOOL)checkMailInput:(NSString *)mail;

/**
 * 正则匹配手机号
 */
+ (BOOL)checkTelNumber:(NSString *) telNumber;

/**
 * 正则匹配用户密码6-18位数字和字母组合
 */
+ (BOOL)checkPassword:(NSString *) password;

/**
 * 正则匹配用户姓名,20位的中文或英文
 */
+ (BOOL)checkUserName : (NSString *) userName;

/**
 * 正则匹配用户身份证号
 */
+ (BOOL)checkUserIdCard: (NSString *) idCard;

/**
 * 正则匹员工号,12位的数字
 */
+ (BOOL)checkEmployeeNumber : (NSString *) number;

/**
 * 正则匹配URL
 */
+ (BOOL)checkURL : (NSString *) url;

/**
 * 正则匹配昵称
 */
+ (BOOL) checkNickname:(NSString *) nickname;

/**
 * 正则匹配以C开头的18位字符
 */
+ (BOOL) checkCtooNumberTo18:(NSString *) nickNumber;

/**
 * 正则匹配以C开头字符
 */
+ (BOOL) checkCtooNumber:(NSString *) nickNumber;

/**
 * 正则匹配银行卡号是否正确
 */
+ (BOOL) checkBankNumber:(NSString *) bankNumber;

/**
 * 正则只能输入数字和字母
 */
+ (BOOL) checkTeshuZifuNumber:(NSString *) CheJiaNumber;

/**
 * 正则匹配车牌号验证
 */
+ (BOOL) checkCarNumber:(NSString *) CarNumber;

#pragma mark - 处理时间、日期
/**
 *  得到当前月份
 */
+ (NSString *)getCurrentMonth:(NSDate *)date;

/**
 *  转换日期格式
 *  @param date   需要转换的日期
 *  @param format 转换成的格式
 */
+ (NSString *)formatDateString:(NSDate *)date withFormate:(NSString *)format;

/**
 *  最近6个月
 *  @return 数组
 */
+ (NSArray *)getLatest6Month;

/**
 *  将 NSString 变为 NSDate
 *  @param dateString 需要转化的时间字符串
 *  @return NSDate
 */
+ (NSDate *)dateFromString:(NSString *)dateString;

/**
 *  返回一个比本地时间早36天的时间
 *  @return NSString
 */
+ (NSString *)dayBefore36Day;

/**
 *  将秒转换成分钟形式 格式为 19:28
 *  @param time 时间参数
 *  @return NSString
 */
+ (NSString *)recordTimeFormat:(int)time;

/**
 *  返回时间戳
 *  @return NSString
 */
+ (NSString *)cSharpStampFromCurrentDate;



#pragma mark - 处理图片

/**
 *  按尺寸压缩生成新图片
 */
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;



#pragma mark - 处理文本格式
/**
 *  过滤字符串中的空白符和换行符
 */
+ (NSString *)deleteSpaceAndReturnLine:(NSString *)text;

/**
 *  加逗号
 *  @param str 传入的字符串参数
 *  @return NSString
 */
+ (NSString *)convertFormatNumberString:(NSString*)str;

/**
 *  清除逗号
 *  @param str 传入的字符串
 *  @return NSString
 */
+ (NSString*)clearcommaOfString:(NSString*)str;



#pragma mark - 处理界面
/**
 *  16进制转颜色
 *  @return BOOL
 */
+ (UIColor *) colorWithHexString: (NSString *) hexString;



#pragma mark - 文件管理
/**
 * 把对象归档存到沙盒里
 */
+ (void)saveObject:(id)object byFileName:(NSString*)fileName;

/**
 * 通过文件名从沙盒中找到归档的对象
 */
+ (id)getObjectByFileName:(NSString*)fileName;

/**
 * 根据文件名删除沙盒中的 plist 文件
 */
+ (void)removeFileByFileName:(NSString*)fileName;

/**
 * 拼接文件路径
 */
+ (NSString*)appendFilePath:(NSString*)fileName;

/**
 * 存储用户偏好设置 到 NSUserDefults
 */
+ (void)saveUserData:(id)data forKey:(NSString*)key;

/**
 * 读取用户偏好设置
 */
+ (id)readUserDataForKey:(NSString*)key;

/**
 * 删除用户偏好设置
 */
+ (void)removeUserDataForkey:(NSString*)key;


@end
