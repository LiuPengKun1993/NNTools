//
//  NSArray+NNArray.h
//  YMWM
//
//  Created by iOS on 16/9/29.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (NNArray)

/** 读取 plist 文件 */
+ (NSArray *)arrayWithPlistName:(NSString *) plistName;

@end
