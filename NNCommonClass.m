//
//  NNCommonClass.m
//  NNCommonMethods
//
//  Created by 刘朋坤 on 17/1/12.
//  Copyright © 2017年 刘朋坤. All rights reserved.
//

#import "NNCommonClass.h"

@implementation NNCommonClass

#pragma mark - 验证类的方法
/**
 *  检查版本更新
 *  @return 整形
 */
+ (int)checkOSVersion {
    
    NSArray *ver = [[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."];
    int osVerson = [[ver objectAtIndex:0] intValue];
    return osVerson;
}

/**
 *  判断是否是第一次加载
 *  @return BOOL
 */
+ (BOOL)isFirstLaunch{
    id isFirstLaunch = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstLaunch"];
    return isFirstLaunch == nil;
}

/**
 * 验证输入是否是数字
 * @param number 传入的数据
 * @return 返回的数据
 */
+ (BOOL)validNumber:(NSString*)number
{
    BOOL isValid = NO;
    NSString *regex = @"^[0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    isValid = [predicate evaluateWithObject:number];
    return isValid;
}

/**
 * 验证纯中文
 */
+ (BOOL)validateChineseWordString:(NSString *)str
{
    NSString *phoneRegex = @"[\u4e00-\u9fa5]+$";
    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    BOOL result = [phoneTest evaluateWithObject:str];
    return result;
}

/**
 * 验证字母数字下划线混合
 */
+ (BOOL)validateMixedWordString:(NSString *)str
{
    NSString *phoneRegex = @"[a-zA-Z0-9_\u4e00-\u9fa5]+$";
    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    BOOL result = [phoneTest evaluateWithObject:str];
    return result;
}

/**
 *  判断是否有空字符串
 */
+ (BOOL)isNullString:(NSString *)str {
    return str == nil || [[self trimString:str] isEqualToString:@""] || [[str lowercaseString] isEqualToString:@"(null)"];
}

+ (NSString *)trimString:(NSString *)oldStr {
    return [oldStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


/**
 *  银行卡号校验
 */
+ (BOOL) isBankCardluhmCheck:(NSString *)bankNumber {
    if (bankNumber.length == 0) {
        return NO;
    }
    NSString *lastNum = [[bankNumber substringFromIndex:(bankNumber.length - 1)] copy]; // 取出最后一位
    NSString *forwardNum = [[bankNumber substringToIndex:(bankNumber.length - 1)] copy]; // 前15或18位
    
    NSMutableArray *forwardArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i<forwardNum.length; i++) {
        NSString *subStr = [forwardNum substringWithRange:NSMakeRange(i, 1)];
        [forwardArr addObject:subStr];
    }
    
    NSMutableArray *forwardDescArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = (int)(forwardArr.count - 1); i > -1; i--) { // 前15位或者前18位倒序存进数组
        [forwardDescArr addObject:forwardArr[i]];
    }
    
    NSMutableArray *arrOddNum = [[NSMutableArray alloc] initWithCapacity:0]; // 奇数位*2的积 < 9
    NSMutableArray *arrOddNum2 = [[NSMutableArray alloc] initWithCapacity:0]; // 奇数位*2的积 > 9
    NSMutableArray *arrEvenNum = [[NSMutableArray alloc] initWithCapacity:0]; // 偶数位数组
    
    for (int i = 0; i < forwardDescArr.count; i++) {
        NSInteger num = [forwardDescArr[i] intValue];
        if (i % 2) { // 偶数位
            [arrEvenNum addObject:[NSNumber numberWithInteger:num]];
        } else { // 奇数位
            if (num * 2 < 9) {
                [arrOddNum addObject:[NSNumber numberWithInteger:num * 2]];
            }else{
                NSInteger decadeNum = (num * 2) / 10;
                NSInteger unitNum = (num * 2) % 10;
                [arrOddNum2 addObject:[NSNumber numberWithInteger:unitNum]];
                [arrOddNum2 addObject:[NSNumber numberWithInteger:decadeNum]];
            }
        }
    }
    
    __block  NSInteger sumOddNumTotal = 0;
    [arrOddNum enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        sumOddNumTotal += [obj integerValue];
    }];
    
    
    __block NSInteger sumOddNum2Total = 0;
    [arrOddNum2 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        sumOddNum2Total += [obj integerValue];
    }];
    
    __block NSInteger sumEvenNumTotal = 0 ;
    [arrEvenNum enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        sumEvenNumTotal += [obj integerValue];
    }];
    
    
    NSInteger lastNumber = [lastNum integerValue];
    
    NSInteger luhmTotal = lastNumber + sumEvenNumTotal + sumOddNum2Total + sumOddNumTotal;
    
    return (luhmTotal % 10 == 0) ? YES:NO;
}

/**
 *  验证手机号是否合法
 */
+ (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString * phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

/**
 *  验证身份证
 */
+ (BOOL)isValidateIDCardNumber:(NSString *)value
{
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([value length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:value]) {
        return NO;
    }
    int summary = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7
    + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9
    + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10
    + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5
    + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8
    + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4
    + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2
    + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6
    + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder, 1)];// 判断校验位
    return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17, 1)] uppercaseString]];
}

/**
 *  根据身份证号获取性别
 */
+ (NSString *)getIdentityCardSex:(NSString *)numberStr {
    int sexInt = [[numberStr substringWithRange:NSMakeRange(16, 1)] intValue];
    
    if(sexInt %2 != 0) {
        return @"1";
    } else {
        return @"2";
    }
}

/**
 *  根据身份证获取年龄
 */
+ (NSString *)getIdentityCardAge:(NSString *)numberStr {
    
    NSDateFormatter *formatterTow = [[NSDateFormatter alloc]init];
    [formatterTow setDateFormat:@"yyyy-MM-dd"];
    NSDate *bsyDate = [formatterTow dateFromString:[self birthdayStrFromIdentityCard:numberStr]];
    
    NSTimeInterval dateDiff = [bsyDate timeIntervalSinceNow];
    
    int age = trunc(dateDiff/(60*60*24)) / 365;
    
    return [NSString stringWithFormat:@"%d",-age];
}

+ (NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr {
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    NSString *year = nil;
    NSString *month = nil;
    
    BOOL isAllNumber = YES;
    
    NSString *day = nil;
    if([numberStr length]<14)
        return result;
    
    //**截取前12位
    NSString *fontNumer = [numberStr substringWithRange:NSMakeRange(0, 11)];
    
    //**检测前12位否全都是数字;
    const char *str = [fontNumer UTF8String];
    const char *p = str;
    while (*p!='\0') {
        if(!(*p>='0'&&*p<='9'))
            isAllNumber = NO;
        p++;
    }
    if(!isAllNumber)
        return result;
    
    year = [NSString stringWithFormat:@"19%@",[numberStr substringWithRange:NSMakeRange(8, 2)]];
    month = [numberStr substringWithRange:NSMakeRange(10, 2)];
    day = [numberStr substringWithRange:NSMakeRange(12,2)];
    
    [result appendString:year];
    [result appendString:@"-"];
    [result appendString:month];
    [result appendString:@"-"];
    [result appendString:day];
    return result;
}





#pragma mark - 正则匹配
/**
 * 正则匹配邮箱号
 */
+ (BOOL)checkMailInput:(NSString *)mail{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:mail];
}

/**
 * 正则匹配手机号
 */
+ (BOOL)checkTelNumber:(NSString *) telNumber
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,183,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[356])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:telNumber] == YES)
        || ([regextestcm evaluateWithObject:telNumber] == YES)
        || ([regextestct evaluateWithObject:telNumber] == YES)
        || ([regextestcu evaluateWithObject:telNumber] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

/**
 * 正则匹配用户密码6-18位数字和字母组合
 */
+ (BOOL)checkPassword:(NSString *) password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}

/**
 * 正则匹配用户姓名,20位的中文或英文
 */
+ (BOOL)checkUserName : (NSString *) userName
{
    
    //    NSString *pattern = @"^[A-Za-z0-9]{6,20}+$";
    NSString *pattern = @"^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
    
}

/**
 * 正则匹配用户身份证号
 */
+ (BOOL)checkUserIdCard: (NSString *) idCard
{
    BOOL flag;
    if (idCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

/**
 * 正则匹员工号,12位的数字
 */
+ (BOOL)checkEmployeeNumber : (NSString *) number
{
    NSString *pattern = @"^[0-9]{12}";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:number];
    return isMatch;
    
}

/**
 * 正则匹配URL
 */
+ (BOOL)checkURL : (NSString *) url
{
    NSString *pattern = @"^[0-9A-Za-z]{1,50}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:url];
    return isMatch;
    
}

/**
 * 正则匹配昵称
 */
+ (BOOL) checkNickname:(NSString *) nickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    BOOL isMatch = [pred evaluateWithObject:nickname];
    return isMatch;
}

/**
 * 正则匹配以C开头的18位字符
 */
+ (BOOL) checkCtooNumberTo18:(NSString *) nickNumber
{
    NSString *nickNum=@"^C{1}[0-9]{18}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nickNum];
    BOOL isMatch = [pred evaluateWithObject:nickNumber];
    return isMatch;
}

/**
 * 正则匹配以C开头字符
 */
+ (BOOL) checkCtooNumber:(NSString *) nickNumber
{
    NSString *nickNum=@"^C{1}[0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nickNum];
    BOOL isMatch = [pred evaluateWithObject:nickNumber];
    return isMatch;
}

/**
 * 正则匹配银行卡号是否正确
 */
+ (BOOL) checkBankNumber:(NSString *) bankNumber{
    NSString *bankNum=@"^([0-9]{16}|[0-9]{19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:bankNumber];
    return isMatch;
}

/**
 * 正则只能输入数字和字母
 */
+ (BOOL) checkTeshuZifuNumber:(NSString *) CheJiaNumber{
    NSString *bankNum=@"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:CheJiaNumber];
    return isMatch;
}

/**
 * 正则匹配车牌号验证
 */
+ (BOOL) checkCarNumber:(NSString *) CarNumber{
    NSString *bankNum = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:CarNumber];
    return isMatch;
}








#pragma mark - 处理时间、日期
/**
 *  得到当前月份
 */
+ (NSString *)getCurrentMonth:(NSDate *)date {
    //NSDate *nowDate = [NSDate date];
    NSString *month = [self formatDateString:date withFormate:@"MM"];
    return month;
}

/**
 *  转换日期格式
 *  @param date   需要转换的日期
 *  @param format 转换成的格式
 */
+ (NSString *)formatDateString:(NSDate *)date withFormate:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:[NSString stringWithFormat:@"%@",format]];
    NSString *returnString = [dateFormatter stringFromDate:date];
    return returnString;
}

/**
 *  最近6个月
 *  @return 数组
 */
+ (NSArray *)getLatest6Month {
    int month = [[self formatDateString:[NSDate date] withFormate:@"M"] intValue];
    NSMutableArray *monthArray = [NSMutableArray array];
    for (int j = 0; j < 6; j++) {
        NSString *preMonth;
        if (month - j > 0) {
            preMonth  = [NSString stringWithFormat:@"%d", month - j];
        }else{
            preMonth  = [NSString stringWithFormat:@"%d", month + 12 - j];
        }
        [monthArray addObject:preMonth];
    }
    return monthArray;
}

/**
 *  将 NSString 变为 NSDate
 *  @param dateString 需要转化的时间字符串
 *  @return NSDate
 */
+ (NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    
    NSTimeZone *tzGMT = [NSTimeZone timeZoneWithName:@"Asia/Chongqing"];
    [NSTimeZone setDefaultTimeZone:tzGMT];
    
    NSRange dateRange = [dateString rangeOfString:@"T"];
    if (dateRange.location == NSNotFound) {
        switch (dateString.length) {
            case 16:
                [dateFormate setDateFormat:@"yyyy-MM-dd HH:mm"];
                break;
            case 19:
                [dateFormate setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                break;
            default:
                [dateFormate setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
                break;
        }
    } else {
        switch (dateString.length) {
            case 16:
                [dateFormate setDateFormat:@"yyyy-MM-dd HH:mm"];
                break;
            case 19:
                [dateFormate setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                break;
            default:
                [dateFormate setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
                break;
        }
    }
    
    NSDate  *dateTime = [dateFormate dateFromString:dateString];
    return dateTime;
}

/**
 *  返回一个比本地时间早36天的时间
 *  @return NSString
 */
+ (NSString *)dayBefore36Day {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [dateFormatter setDateFormat: @"yyyy/MM/dd HH:mm:ss.SSS"];
    NSDate *destDate= [[NSDate date] dateByAddingTimeInterval:(-36*24*60*60)];
    NSString *before35Day = [dateFormatter stringFromDate:destDate];
    return before35Day;
}

/**
 *  将秒转换成分钟形式 格式为 19:28
 *  @param time 时间参数
 *  @return NSString
 */
+ (NSString *)recordTimeFormat:(int)time {
    
    int minute = time / 60;
    NSString *minuteString = @"";
    if (minute < 10) {
        minuteString = [NSString stringWithFormat:@"0%d",minute];
    } else {
        minuteString = [NSString stringWithFormat:@"%d",minute];
    }
    
    int second = time%60;
    NSString *secondString = @"";
    if (second < 10) {
        secondString = [NSString stringWithFormat:@"0%d",second];
    } else {
        secondString = [NSString stringWithFormat:@"%d",second];
    }
    NSString *ms = [NSString stringWithFormat:@"%@:%@",minuteString,secondString];
    return ms;
}

/**
 *  返回时间戳
 *  @return NSString
 */
//返回时间戳
+(NSString *)cSharpStampFromCurrentDate{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [dateFormatter setDateFormat: @"yyyyMMddHHmmssSSS"];
    NSString *time = [dateFormatter stringFromDate:[NSDate date]];
    return time;
}


#pragma mark - 处理图片

/**
 *  按尺寸压缩生成新图片
 */
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

#pragma mark - 处理文本格式
/**
 *  过滤字符串中的空白符和换行符
 */
+ (NSString *)deleteSpaceAndReturnLine:(NSString *)text {
    text = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  // 去除掉首尾的空白字符和换行字符
    text = [text stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    text = [text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return text;
}

/**
 *  加逗号
 *  @param str 传入的字符串参数
 *  @return NSString
 */
+ (NSString *)convertFormatNumberString:(NSString*)str {
    @try
    {
        if (str.length < 3) {
            return str;
        }
        NSString *numStr = str;
        NSArray *array = [numStr componentsSeparatedByString:@"."];
        NSString *numInt = [array objectAtIndex:0];
        if (numInt.length <= 3) {
            return str;
        }
        NSString *suffixStr = @"";
        if ([array count] > 1) {
            suffixStr = [NSString stringWithFormat:@".%@",[array objectAtIndex:1]];
        }
        
        NSMutableArray *numArr = [[NSMutableArray alloc] init];
        while (numInt.length > 3) {
            NSString *temp = [numInt substringFromIndex:numInt.length - 3];
            numInt = [numInt substringToIndex:numInt.length - 3];
            [numArr addObject:[NSString stringWithFormat:@",%@",temp]];//得到的倒序的数据
        }
        NSInteger count = [numArr count];
        for (int i = 0; i < count; i++) {
            numInt = [numInt stringByAppendingFormat:@"%@",[numArr objectAtIndex:(count -1 -i)]];
        }
        numStr = [NSString stringWithFormat:@"%@%@",numInt,suffixStr];
        return numStr;
    }
    @catch (NSException *exception) {
        return str;
    }
    @finally {
    }
}

/**
 *  清除逗号
 *  @param str 传入的字符串
 *  @return NSString
 */
+ (NSString*)clearcommaOfString:(NSString*)str {
    if (str && str.length) {
        NSMutableString *string =[NSMutableString stringWithString:str];
        if (string && string.length > 0 ) {
            [string replaceOccurrencesOfString:@"," withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, string.length)];
            return [NSString stringWithFormat:@"%@",string];
        }
    } else {
        str = @"0";
    }
    return str;
}

#pragma mark - 处理界面
/**
 *  16进制转颜色
 *  @return BOOL
 */
+ (UIColor *) colorWithHexString: (NSString *) hexString
{
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#"withString: @""] uppercaseString];
    CGFloat alpha = 1, red = 1, blue = 1, green = 1;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            NSLog(@"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString);
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
    
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}


#pragma mark - 文件管理
/**
 * 把对象归档存到沙盒里
 */
+ (void)saveObject:(id)object byFileName:(NSString*)fileName {
    NSString *path  = [self appendFilePath:fileName];
    
    [NSKeyedArchiver archiveRootObject:object toFile:path];
    
}

/**
 * 通过文件名从沙盒中找到归档的对象
 */
+ (id)getObjectByFileName:(NSString*)fileName {
    
    NSString *path  = [self appendFilePath:fileName];
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

/**
 * 根据文件名删除沙盒中的 plist 文件
 */
+ (void)removeFileByFileName:(NSString*)fileName {
    NSString *path  = [self appendFilePath:fileName];
    
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

/**
 * 拼接文件路径
 */
+ (NSString*)appendFilePath:(NSString*)fileName {
    
    NSString *documentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    NSString *file = [NSString stringWithFormat:@"%@/%@.archiver",documentsPath,fileName];
    
    return file;
}

/**
 * 存储用户偏好设置 到 NSUserDefults
 */
+ (void)saveUserData:(id)data forKey:(NSString*)key {
    if (data)
    {
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

/**
 * 读取用户偏好设置
 */
+ (id)readUserDataForKey:(NSString*)key {
    return [[NSUserDefaults standardUserDefaults]objectForKey:key];
}

/**
 * 删除用户偏好设置
 */
+ (void)removeUserDataForkey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
}

@end
