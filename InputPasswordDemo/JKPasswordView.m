
//
//  JKPasswordView.m
//  InputPasswordDemo
//
//  Created by bailixi on 2017/11/3.
//  Copyright © 2017年 bluesky. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "JKPasswordView.h"
#import "JKPasswordTextField.h"
#define K_Field_Height self.frame.size.height  //每一个输入框的高度等于当前view的高度
#define point_WIDTH 10 //密码点的大小
#define Text_Count 6  //密码个数

@interface JKPasswordView ()<UITextFieldDelegate>
@property (nonatomic, strong)JKPasswordTextField *textField;
@property (nonatomic, strong)NSMutableArray *pointArray;
@end

@implementation JKPasswordView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
       
        [self initPutPwdTextField];
    }
    return self;
}

- (void)initPutPwdTextField {
    //1.画竖线
    for (int i = 0; i < Text_Count; i++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake((i+1)* self.frame.size.width / Text_Count, 0, 1, self.textField.frame.size.height)];
        lineView.backgroundColor = UIColorFromRGB(0xcccccc);
        [self.textField addSubview:lineView];
    }
    //每个密码输入框的宽度
    CGFloat width = self.frame.size.width / Text_Count;
    
    //2.画黑色安全码
    for (int i = 0; i < Text_Count; i++) {
        UIView *securtyView = [[UIView alloc] initWithFrame:CGRectMake((width - point_WIDTH) / 2 + i * width  , (K_Field_Height - point_WIDTH)/2, point_WIDTH, point_WIDTH)];
        securtyView.backgroundColor = [UIColor blackColor];
        securtyView.layer.cornerRadius = 5;
        securtyView.layer.masksToBounds = YES;
        securtyView.hidden = YES;
        [self.textField addSubview:securtyView];
        [self.pointArray addObject:securtyView];
    }
    
}

- (void)textFieldDidChange:(JKPasswordTextField *)textField {
    for (UIView *point in self.pointArray) {
        point.hidden = YES;
    }
    for (int i = 0; i < self.textField.text.length; i++) {
        UIView *pointView = (UIView *)self.pointArray[i];
        pointView.hidden = NO;
    }
    
    NSLog(@"=========%@",textField.text);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }else if (string.length == 0) {
        return YES;
    }else if (textField.text.length >= Text_Count) {
        [self.delegate transPwdText:textField.text];
        [self.textField resignFirstResponder];
        return NO;
    }else{
        return YES;
    }
}

- (JKPasswordTextField *)textField {
    if (!_textField) {
        _textField = [[JKPasswordTextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, K_Field_Height)];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.tintColor = [UIColor clearColor];
        _textField.delegate = self;
        _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.layer.borderColor = UIColorFromRGB(0xcccccc).CGColor;
        _textField.layer.borderWidth = 1;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        _textField.textColor = [UIColor clearColor];
       [self addSubview:self.textField];
    }
    return _textField;
}

- (NSMutableArray *)pointArray {
    if (!_pointArray) {
        _pointArray = [[NSMutableArray alloc] init];
    }
    return _pointArray;
}

@end
