//
//  HSDownLoadBaseTVC.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadBaseTVC.h"
#import "HSNoDownLoadView.h"
#import "Base.h"

@interface HSDownLoadBaseTVC ()

@property (nonatomic, strong) HSNoDownLoadView *noDataView;


@end

@implementation HSDownLoadBaseTVC

-(void)setShowNoDataPane:(BOOL)showNoDataPane
{
    _showNoDataPane = showNoDataPane;
    
    self.noDataView.hidden = !_showNoDataPane;
}

-(HSNoDownLoadView *)noDataView
{
    if (_noDataView == nil) {
        if ([NSStringFromClass([self class]) isEqualToString:@"HSDownLoadingTVC"]) {
            _noDataView = [HSNoDownLoadView noDownLoadViewWithType:HSNoDownLoadViewNoDownLoading];
        }else
        {
            _noDataView = [HSNoDownLoadView noDownLoadViewWithType:HSNoDownLoadViewNoDownLoaded];
        }
        
        [self.tableView addSubview:_noDataView];
    }
    return _noDataView;
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.noDataView.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight * 0.3);
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.backgroundColor = kCommonColor;
    self.tableView.tableFooterView = [UIView new];
    
    kWeakSelf
    self.noDataView.clickBlock = ^{
        //        HSLog(@"跳转到查找界面")
//        HSTodayFireVC *todayF = [[HSTodayFireVC alloc] init];
//        [weakSelf.navigationController pushViewController:todayF animated:YES];
    };
    
    // 监听下载状态改变的通知
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:kDownLoadStateChangeNotification object:nil];
    
}

- (void)loadData {
    
}

-(void)dealloc
{
    // 移除通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
