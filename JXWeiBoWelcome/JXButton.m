//
//  JXButton.m
//  JXWeiBoWelcome
//
//  Created by yuezuo on 16/5/10.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "JXButton.h"

@implementation JXButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

// 改变默认图片位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.width * 0.8;
    return CGRectMake(x, y, w, h);
}

// 改变默认标题位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = contentRect.size.height * 0.8;
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.width * 0.2;
    return CGRectMake(x, y, w, h);
}

// 取消高亮状态
- (void)setHighlighted:(BOOL)highlighted {}

@end
