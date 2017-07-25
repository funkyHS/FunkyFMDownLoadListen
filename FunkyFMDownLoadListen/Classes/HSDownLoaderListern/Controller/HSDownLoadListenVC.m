//
//  HSDownLoadListenVC.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadListenVC.h"
#import "HSSementBarVC.h"
#import "HSDownLoadingTVC.h"
#import "HSAlbumTVC.h"
#import "HSVoiceTVC.h"
#import "Base.h"

@interface HSDownLoadListenVC ()

@property (nonatomic, weak) HSSementBarVC *segmentBarVC;


@end

@implementation HSDownLoadListenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.segmentBarVC.segmentBar.frame = CGRectMake(0, 0, kScreenWidth, 35);
    self.navigationItem.titleView = self.segmentBarVC.segmentBar;
    self.segmentBarVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentBarVC.view];
    
    NSArray *items = @[@"专辑", @"声音", @"下载中"];
    // 添加几个自控制器
    // 在contentView, 展示子控制器的视图内容
    [self.segmentBarVC setUpWithItems:items childVCs:@[[HSAlbumTVC new], [HSVoiceTVC new], [HSDownLoadingTVC new]]];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
        
}

#pragma mark - 懒加载

- (HSSementBarVC *)segmentBarVC {
    if (!_segmentBarVC) {
        HSSementBarVC *vc = [[HSSementBarVC alloc] init];
        [self addChildViewController:vc];
        _segmentBarVC = vc;
    }
    return _segmentBarVC;
}


@end
