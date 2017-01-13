//
//  NSArray+NNArray.m
//  YMWM
//
//  Created by iOS on 16/9/29.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NSArray+NNArray.h"

@implementation NSArray (NNArray)

#pragma mark - 读取 plist 文件
+ (NSArray *)arrayWithPlistName:(NSString *)plistName {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@".plist"];
    
    return [NSArray arrayWithContentsOfFile:plistPath];
}
@end
