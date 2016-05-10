//
//  JXItemModel.m
//  JXWeiBoWelcome
//
//  Created by yuezuo on 16/5/10.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "JXItemModel.h"

@implementation JXItemModel



+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image {
    JXItemModel * item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;
}
@end
