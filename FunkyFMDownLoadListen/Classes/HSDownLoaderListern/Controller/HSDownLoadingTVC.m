//
//  HSDownLoadingTVC.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadingTVC.h"

#import "HSDownLoadListernDataTool.h"
#import "HSDownLoadVoiceCellPresenter.h"
#import "HSDownLoadVoiceCell.h"

@interface HSDownLoadingTVC ()

@end

@implementation HSDownLoadingTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self reloadCache];
}
- (void)reloadCache {
    
    NSArray <HSDownLoadVoiceModel *>*downLoadingMs = [HSDownLoadListernDataTool getDownLoadingVoiceMs];
    
    NSMutableArray <HSDownLoadVoiceCellPresenter *>*downLoadingPresenters = [NSMutableArray arrayWithCapacity:downLoadingMs.count];
    for (HSDownLoadVoiceModel *downLoadingM in downLoadingMs) {
        HSDownLoadVoiceCellPresenter *presenter = [HSDownLoadVoiceCellPresenter new];
        presenter.voiceM = downLoadingM;
        [downLoadingPresenters addObject:presenter];
    }
    
    
    [self setUpWithDataSouce:downLoadingPresenters getCell:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        return [HSDownLoadVoiceCell cellWithTableView:tableView];
    } cellHeight:^CGFloat(id model) {
        return 110;
    } bind:^(HSDownLoadVoiceCell *cell, HSDownLoadVoiceCellPresenter *model) {
        [model bindWithCell:cell];
    }];
    
    
}





@end
