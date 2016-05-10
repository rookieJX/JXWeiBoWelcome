//
//  JXWelcome.m
//  JXWeiBoWelcome
//
//  Created by yuezuo on 16/5/10.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "JXWelcome.h"

@interface JXWelcome ()
@property (weak, nonatomic) IBOutlet UIImageView *shareImage;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;

@end

@implementation JXWelcome

+ (instancetype)welcome {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}


// 当将要加载到父视图上的时候
- (void)didMoveToSuperview {
    // 设置头像属性
    self.iconImage.layer.cornerRadius = self.iconImage.bounds.size.width / 2;
    self.iconImage.clipsToBounds = YES;
    self.iconImage.transform = CGAffineTransformMakeTranslation(0, 100);
    
    // 添加微博标志动画,
    [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        // 隐藏微博问候语
        self.shareImage.alpha = 0;
    } completion:^(BOOL finished) {
        
        self.iconImage.hidden = NO;
        // 设置头像动画
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.iconImage.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            self.welcomeLabel.alpha = 0;
            self.welcomeLabel.hidden = NO;
            // 设置欢迎文字
            [UIView animateWithDuration:1 animations:^{
                self.welcomeLabel.alpha = 1;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }];
    }];
    
}
@end
