//
//  CustomNavigationController.m
//  iphoneXDemo
//
//  Created by 张向东 on 2017/9/25.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
}


- (void)setupNavigationBar {
    
    self.navigationBar.barTintColor = [UIColor cyanColor];
}
@end













