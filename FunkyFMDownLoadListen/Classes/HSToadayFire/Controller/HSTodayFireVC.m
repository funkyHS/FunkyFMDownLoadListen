//
//  HSTodayFireVC.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/18.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSTodayFireVC.h"
#import "HSSementBarVC.h"
#import "Base.h"
#import "HSTodayFireDataProvider.h"
#import "HSTodayFireVoiceListTVC.h"


@interface HSTodayFireVC ()

@property (nonatomic, weak) HSSementBarVC *segmentBarVC;

@property (nonatomic, strong) NSArray<HSCategoryModel *> *categoryMs;


@end

@implementation HSTodayFireVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"今日最火";
    self.view.tag = 666;
    self.view.backgroundColor = kCommonColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.segmentBarVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentBarVC.view];
    
    
    
    // 获取顶部选项卡的信息
    kWeakSelf
    [[HSTodayFireDataProvider shareInstance] getTodayFireCategoryMs:^(NSArray<HSCategoryModel *> *categoryMs) {
        weakSelf.categoryMs = categoryMs;
    }];
    
    // 更新 segmentBar 的样式
    [self.segmentBarVC.segmentBar updateWithConfig:^(HSSegmentBarConfig *config) {
        config.isShowMore = YES;
        config.segmentBarBackColor = [UIColor whiteColor];
    }];
    
}


- (void)setUpWithItems: (NSArray <NSString *>*)items {
    
    // 添加子控制器
    NSMutableArray *arrVC = [NSMutableArray arrayWithCapacity:items.count];
    for (int i = 0; i < items.count; i++) {
        HSTodayFireVoiceListTVC *vc = [[HSTodayFireVoiceListTVC alloc] init];
        vc.loadKey = self.categoryMs[i].key;
        //vc.view.backgroundColor = HSRandomColor;
        [arrVC addObject:vc];
    }
    
    [self.segmentBarVC setUpWithItems:items childVCs:arrVC];
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

-(void)setCategoryMs:(NSArray<HSCategoryModel *> *)categoryMs {
    _categoryMs = categoryMs;
    [self setUpWithItems:[categoryMs valueForKeyPath:@"name"]];
}




@end
