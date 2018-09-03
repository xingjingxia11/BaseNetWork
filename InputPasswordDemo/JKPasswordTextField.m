
//
//  JKPasswordTextField.m
//  InputPasswordDemo
//
//  Created by bailixi on 2017/11/3.
//  Copyright © 2017年 bluesky. All rights reserved.
//

#import "JKPasswordTextField.h"

@implementation JKPasswordTextField

/**
 * /禁止可被粘贴复制
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
