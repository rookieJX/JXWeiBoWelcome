//
//  JXMenuController.m
//  JXWeiBoWelcome
//
//  Created by yuezuo on 16/5/10.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "JXMenuController.h"

#import "JXButton.h"

#import "JXItemModel.h"

@interface JXMenuController ()

/** 存储所有的UIButton */
@property (nonatomic,strong) NSMutableArray * itemArray;
/** 定时器 */
@property (nonatomic,strong) NSTimer * timer;
/** 角标 */
@property (nonatomic,assign) NSInteger index ;
@end

@implementation JXMenuController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

#pragma mark - 定时器
- (void)timeChange {
    if (self.index == self.items.count) {
        [self.timer invalidate];
        return;
    };
    JXButton * btn = self.itemArray[self.index];
    [self setAnimateWithButton:btn];
    self.index ++;
}
#pragma mark - 设置UIButton
// 设置界面

- (void)setItems:(NSArray *)items {
    _items = items;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat wh = 100;
    NSInteger cols = 3;
    NSInteger rows = (self.items.count / cols == 0 ? self.items.count / cols : self.items.count / cols + 1);
    NSInteger col = 0;
    NSInteger row = 0;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - wh * cols) / (cols + 1);
    CGFloat bottom = ([UIScreen mainScreen].bounds.size.height - wh * rows) - 100;
    
    for (NSInteger i = 0; i<self.items.count; i++) {
        // 设置button
        JXButton * button = [JXButton buttonWithType:UIButtonTypeCustom];
        
        col = i % cols;
        row = i / cols;
        
        x = margin + col * (margin + wh);
        y = bottom + row * (margin + wh);
        
        button.frame = CGRectMake(x, y, wh, wh);
        
        // 设置button属性，图片，文字
        JXItemModel * item = self.items[i];
        [button setImage:item.image forState:UIControlStateNormal];
        [button setTitle:item.title forState:UIControlStateNormal];
        // 监听当手指按下的时候
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        // 监听当手指抬起的时候
        [button addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
        // 将控件偏移到底部
        button.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height);
        
        // 将设置的UIButton，存放到数组上
        [self.itemArray addObject:button];
        [self.view addSubview:button];
    }

}

#pragma mark - 点击button
/**
 *  手指点击按下的时候
 */
- (void)btnClick:(JXButton *)button {
    [UIView animateWithDuration:0.4 animations:^{
        
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
    
}

/**
 *  手指松开的时候
 */
- (void)btnClick2:(JXButton *)button {
    [UIView animateWithDuration:0.4 animations:^{
        button.transform = CGAffineTransformMakeScale(2.0, 2.0);
        button.alpha = 0;
    }];
}
#pragma mark - 设置所用动画
- (void)setAnimateAllBtn {
    // 取出数组进行设置
    for (JXButton * button in self.itemArray) {
        [self setAnimateWithButton:button];
    }
}
#pragma mark - 设置单个动画
- (void)setAnimateWithButton:(JXButton *)button {
    
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        // 将控件复原
        button.transform = CGAffineTransformIdentity;
    } completion:nil];
}
#pragma mark - 懒加载
- (NSMutableArray *)itemArray {
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

@end
