//
//  NSString+NNString.m
//  YMWM
//
//  Created by iOS on 16/9/29.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NSString+NNString.h"

@implementation NSString (NNString)

+ (NSString *)getMinuteSecondWithSecond:(NSTimeInterval)time {
    
    int minute = (int)time / 60;
    int second = (int)time % 60;
    
    if (second > 10) {
        return [NSString stringWithFormat:@"%d:%d",minute,second];
    }
    return [NSString stringWithFormat:@"%d:0%d",minute,second];
}

@end
