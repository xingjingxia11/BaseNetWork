//
//  JKPasswordView.h
//  InputPasswordDemo
//
//  Created by bailixi on 2017/11/3.
//  Copyright © 2017年 bluesky. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JKPasswordViewDelegate <NSObject>//协议

- (void)transPwdText:(NSString *)text;//协议方法

@end

@interface JKPasswordView : UIView
@property (nonatomic, weak)id <JKPasswordViewDelegate>delegate;
@end
