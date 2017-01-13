//
//  UITextField+NNExtension.h
//  YMWM
//
//  Created by iOS on 16/7/14.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (NNExtension)

- (NSRange)selectedRange;
- (void)setSelectedRange:(NSRange) range;

@end
