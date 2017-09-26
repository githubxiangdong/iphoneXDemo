//
//  HomeViewController.m
//  iphoneXDemo
//
//  Created by 张向东 on 2017/9/25.
//  Copyright © 2017年 张向东. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "NextViewController.h"

static NSString *kHomeCellID = @"kHomeCellID";

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@end

@implementation HomeViewController

#pragma mark:- 懒加载控件
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        CGRect frame = CGRectMake(0, 0, kWidth, kHeight);
        _tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:kHomeCellID];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = YES;
}


#pragma mark:- 设置UI
- (void)setupUI {
    
    self.navigationItem.title = @"我是iPhoneX";
    [self.view addSubview:self.tableView];
}


#pragma mark:- 调用tableView的数据源协议 UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeCellID forIndexPath:indexPath];
    
    return cell;
}


#pragma mark:- 调用tableView的协议 UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NextViewController *nextVc = [[NextViewController alloc]init];
    [self.navigationController pushViewController:nextVc animated:YES];
}
@end






