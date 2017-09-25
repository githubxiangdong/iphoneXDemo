//
//  AppDelegate.m
//  iphoneXDemo
//
//  Created by 张向东 on 2017/9/22.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIViewController *viewCon = nil;
    viewCon = [[CustomTabBarController alloc]init];
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = viewCon;
    
    return YES;
}
@end







