//
//  FlexibleFrame.m
//  layer狂魔33
//
//  Created by rimi on 15/6/11.
//  Copyright (c) 2015年 zhangyi. All rights reserved.
//

#import "FlexibleFrame.h"
#define IPHONE5_SCREEN CGSizeMake(320,568)

@implementation FlexibleFrame

- (CGFloat)ratio
{
    //判断适配4s
    if ([UIScreen mainScreen].bounds.size.width == 480) {
        return [[UIScreen mainScreen] bounds].size.height/IPHONE5_SCREEN.height;
    }
    return [[UIScreen mainScreen] bounds].size.width/IPHONE5_SCREEN.width;
    
}

+ (CGFloat)flexibleFloat:(CGFloat)aFloat
{
    FlexibleFrame * flexible = [[FlexibleFrame alloc] init];
    return aFloat * [flexible ratio];
}

+ (CGRect)frameFromIphone5Frame:(CGRect)iphone5Frame
{
    
    CGFloat x;
    CGFloat y;
    CGFloat width;
    CGFloat height;
    if ([UIScreen mainScreen].bounds.size.width == 480) {
        y = [FlexibleFrame flexibleFloat:iphone5Frame.origin.y];
        height = [FlexibleFrame flexibleFloat:iphone5Frame.size.height];
        x = iphone5Frame.origin.x;
        width = iphone5Frame.size.width;
    }else{
        y = [FlexibleFrame flexibleFloat:iphone5Frame.origin.y];
        x = [FlexibleFrame flexibleFloat:iphone5Frame.origin.x];
        height = [FlexibleFrame flexibleFloat:iphone5Frame.size.height];
        width = [FlexibleFrame flexibleFloat:iphone5Frame.size.width];
    }
    
    return CGRectMake(x, y, width, height);
}

+ (void)flexibleFontSizeWithSuperView:(UIView *)superView
{
    for (UIView *subView in superView.subviews) {
        if (subView.subviews.count > 0) {
            [FlexibleFrame flexibleFontSizeWithSuperView:subView];
        }
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)subView;
            label.font = [UIFont fontWithName:label.font.fontName size:[FlexibleFrame flexibleFloat:label.font.pointSize]];
        }
        if ([subView isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)subView;
            textField.font = [UIFont fontWithName:textField.font.fontName size:[FlexibleFrame flexibleFloat:textField.font.pointSize]];
        }
    }
}



@end
