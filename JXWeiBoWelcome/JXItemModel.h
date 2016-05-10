//
//  JXItemModel.h
//  JXWeiBoWelcome
//
//  Created by yuezuo on 16/5/10.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface JXItemModel : NSObject
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image;

/** 图片 */
@property (nonatomic,strong) UIImage * image;
/** 标题 */
@property (nonatomic,strong) NSString * title;

@end
