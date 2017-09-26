//
//  CustomTabBarController.m
//  iphoneXDemo
//
//  Created by 张向东 on 2017/9/25.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import "CustomTabBarController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "CustomNavigationController.h"
@interface CustomTabBarController ()

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) NSMutableArray *tabBarArr;
@end

@implementation CustomTabBarController

#pragma mark:- 懒加载控件
- (UITabBarController *)tabBarController {
    
    if (!_tabBarController) {
        
        _tabBarController = [[UITabBarController alloc]init];
        _tabBarController.tabBar.barTintColor = [UIColor greenColor];
    }
    return _tabBarController;
}
- (NSMutableArray *)tabBarArr {
    
    if (!_tabBarArr) {
        
        _tabBarArr = [NSMutableArray array];
    }
    return _tabBarArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}



#pragma ark:- 设置UI
- (void)setupUI {
    
    NSArray *images = @[@"tab_live", @"tab_me"];
    NSArray *selectedImages = @[@"tab_live_p", @"tab_me_p"];
    NSArray *vcArr = @[@"HomeViewController", @"MineViewController"];
    [self.tabBarArr removeAllObjects];
    
    for (int i = 0; i < vcArr.count; i++) {
        
        Class cls = NSClassFromString(vcArr[i]);
        UIViewController *vc = [[cls alloc]init];
        
        CustomNavigationController *nav = [[CustomNavigationController alloc]initWithRootViewController:vc];
        nav.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);// 调整item的位置
        nav.tabBarItem.image = [[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [self.tabBarArr addObject:nav];
    }
    
    self.tabBarController.viewControllers = self.tabBarArr;
    [self.view addSubview:self.tabBarController.view];
}
@end










