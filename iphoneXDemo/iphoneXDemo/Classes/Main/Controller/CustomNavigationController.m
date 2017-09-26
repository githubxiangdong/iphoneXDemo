//
//  CustomNavigationController.m
//  iphoneXDemo
//
//  Created by 张向东 on 2017/9/25.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import "CustomNavigationController.h"
#import "objc/runtime.h"
@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self setupPopGesture];
}


- (void)setupNavigationBar {
    
    self.navigationBar.barTintColor = [UIColor cyanColor];
}


// 设置全屏手势
- (void)setupPopGesture {
    
    // 1, 获取系统的pop手势
    UIGestureRecognizer *systemGesture = self.interactivePopGestureRecognizer;
    // 2, 获取pop手势上的view
    UIView *gestureView = systemGesture.view;
    
    
    // 3, 获取target、action
    // 3.1, 利用云运行时
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &count);
    for (int i = 0; i < count; i++) {
        
        NSString *typeStr = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivars[i])];
        NSString *nameStr = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        NSLog(@"type == %@",typeStr);
        NSLog(@"name == %@",nameStr);
    }
    // 3.2, 打印_targets
    NSArray *targets = [systemGesture valueForKey:@"_targets"];
    for (int i = 0; i < targets.count; i++) {
        NSLog(@"_targets == %@",targets[i]);
//        _targets == (action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fd116c28c90>)
    }
    id targetObjc = targets.firstObject;
    NSLog(@"targetObjc == %@",targetObjc);
    // 3.3, 取出target
    id target = [targetObjc valueForKey:@"target"];
    // 3.4, 取出action
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    
    
    // 4, 创建自己的pan手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    [gestureView addGestureRecognizer:panGesture];
    [panGesture addTarget:target action:action];
}
@end













