//
//  HSDownLoadBaseTVC.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadBaseTVC.h"
#import "HSNoDownLoadView.h"
#import "HSTodayFireVC.h"


@interface HSDownLoadBaseTVC ()

@property (nonatomic, weak) HSNoDownLoadView *noDataLoadView;

@property (nonatomic, strong) NSArray *dataSources;

@property (nonatomic, copy) GetCellBlock cellBlock;
@property (nonatomic, copy) GetHeightBlock heightBlock;
@property (nonatomic, copy) BindBlock bindBlock;

@end

@implementation HSDownLoadBaseTVC

-(void)dealloc {
    // 移除通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat x = self.view.frame.size.width * 0.5;
    CGFloat y = self.view.frame.size.height * 0.4;
    self.noDataLoadView.center = CGPointMake(x,y);
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // 监听重新加载数据的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCache) name:@"reloadCache" object:nil];
    
    [self setUpUI];
    
    [self setUpData];

}

- (void)setUpUI {
    self.tableView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
    self.tableView.tableFooterView = [UIView new];
}

- (void)setUpData {
    
    
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSLog(@"currentBundle == %@",currentBundle.infoDictionary);
    NSString *currentBundleName = currentBundle.infoDictionary[@"CFBundleName"];

    
    if ([self isKindOfClass:NSClassFromString(@"HSDownLoadingTVC")]) {
        NSString *noLoadingImgPath = [currentBundle pathForResource:@"noData_downloading@2x.png" ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle", currentBundleName]];
        self.noDataLoadView.noDataImg = [UIImage imageWithContentsOfFile:noLoadingImgPath];
        
        //self.noDataLoadView.noDataImg = [UIImage imageNamed:@"noData_downloading"];
    }else {
        
        NSString *noLoadedImgPath = [currentBundle pathForResource:@"noData_download.png" ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle", currentBundleName]];
        self.noDataLoadView.noDataImg = [UIImage imageWithContentsOfFile:noLoadedImgPath];

        //self.noDataLoadView.noDataImg = [UIImage imageNamed:@"noData_download"];
    }
    
    
    [self.noDataLoadView setClickBlock:^{

        HSTodayFireVC *todayFire = [[HSTodayFireVC alloc] init];
        [self.navigationController pushViewController:todayFire animated:YES];
    }];
}

- (void)reloadCache {
    NSLog(@"重新加载数据");
}

- (void)setUpWithDataSouce: (NSArray *)dataSource getCell: (GetCellBlock)cellBlock cellHeight: (GetHeightBlock)cellHeightBlock bind: (BindBlock)bindBlock {
    
    self.dataSources = dataSource;
    self.cellBlock = cellBlock;
    self.heightBlock = cellHeightBlock;
    self.bindBlock = bindBlock;
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    self.noDataLoadView.hidden = self.dataSources.count != 0;
    return self.dataSources.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = self.cellBlock(tableView, indexPath);
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id model = self.dataSources[indexPath.row];
    self.bindBlock(cell, model);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.dataSources[indexPath.row];
    if (self.heightBlock) {
        return  self.heightBlock(model);
    }
    return 44;
}

#pragma mark - 懒加载

- (HSNoDownLoadView *)noDataLoadView {
    if (!_noDataLoadView) {
        HSNoDownLoadView *noLoadView = [HSNoDownLoadView noDownLoadView];
        [self.view addSubview:noLoadView];
        _noDataLoadView = noLoadView;
    }
    return _noDataLoadView;
}

@end
