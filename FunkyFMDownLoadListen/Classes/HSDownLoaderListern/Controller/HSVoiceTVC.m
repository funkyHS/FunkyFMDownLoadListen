//
//  HSVoiceTVC.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSVoiceTVC.h"
#import "HSDownLoadListernDataTool.h"
#import "HSDownLoadVoiceCellPresenter.h"

@interface HSVoiceTVC ()




@end

@implementation HSVoiceTVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadCache];
}


- (void)reloadCache {
    
    NSArray <HSDownLoadVoiceModel *>*downLoadingMs = [HSDownLoadListernDataTool getDownLoadedVoiceMs];
    
    NSMutableArray <HSDownLoadVoiceCellPresenter *>*downLoadingPresenters = [NSMutableArray arrayWithCapacity:downLoadingMs.count];
    for (HSDownLoadVoiceModel *downLoadingM in downLoadingMs) {
        HSDownLoadVoiceCellPresenter *presenter = [HSDownLoadVoiceCellPresenter new];
        presenter.voiceM = downLoadingM;
        [downLoadingPresenters addObject:presenter];
    }
    
    
    [self setUpWithDataSouce:downLoadingPresenters getCell:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        return [HSDownLoadVoiceCell cellWithTableView:tableView];
    } cellHeight:^CGFloat(id model) {
        return 88;
    } bind:^(HSDownLoadVoiceCell *cell, HSDownLoadVoiceCellPresenter *model) {
        [model bindWithCell:cell];
    }];
    
    
}



@end
