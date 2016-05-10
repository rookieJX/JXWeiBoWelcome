//
//  ViewController.m
//  JXWeiBoWelcome
//
//  Created by yuezuo on 16/5/10.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "ViewController.h"

#import "JXMenuController.h"

#import "JXItemModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)addBtnClick:(UIButton *)sender {
    
    // 创建模型对象
    JXItemModel *item = [JXItemModel itemWithTitle:@"点评" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    JXItemModel *item1 = [JXItemModel itemWithTitle:@"更多" image:[UIImage imageNamed:@"tabbar_compose_more"]];
    JXItemModel *item2 = [JXItemModel itemWithTitle:@"拍摄" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
    JXItemModel *item3 = [JXItemModel itemWithTitle:@"相册" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
    JXItemModel *item4 = [JXItemModel itemWithTitle:@"文字" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
    JXItemModel *item5 = [JXItemModel itemWithTitle:@"签到" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    
    JXMenuController * menu = [[JXMenuController alloc] init];
    menu.view.backgroundColor = [UIColor orangeColor];
    menu.items = @[item,item1,item2,item3,item4,item5];
    [self presentViewController:menu animated:YES completion:nil];
}

@end
