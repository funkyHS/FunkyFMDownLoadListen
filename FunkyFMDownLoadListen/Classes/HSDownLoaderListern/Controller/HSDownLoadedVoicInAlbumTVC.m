//
//  HSDownLoadedVoicInAlbumTVC.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/25.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadedVoicInAlbumTVC.h"
#import "HSDownLoadVoiceCellPresenter.h"
#import "HSDownLoadVoiceCell.h"
#import "HSDownLoadListernDataTool.h"

@interface HSDownLoadedVoicInAlbumTVC ()

@end

@implementation HSDownLoadedVoicInAlbumTVC


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadCache];
}

- (void)reloadCache {
    
    NSArray <HSDownLoadVoiceModel *>*downLoadingMs = [HSDownLoadListernDataTool getDownLoadedVoiceMsInAlbumID:self.albumID];
    NSMutableArray <HSDownLoadVoiceCellPresenter *>*downLoadingPresenters = [NSMutableArray arrayWithCapacity:downLoadingMs.count];
    for (HSDownLoadVoiceModel *downLoadingM in downLoadingMs) {
        HSDownLoadVoiceCellPresenter *presenter = [HSDownLoadVoiceCellPresenter new];
        presenter.voiceM = downLoadingM;
        [downLoadingPresenters addObject:presenter];
    }
    
    
    [self setUpWithDataSouce:downLoadingPresenters getCell:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        return [HSDownLoadVoiceCell cellWithTableView:tableView];
    } cellHeight:^CGFloat(id model) {
        return 80;
    } bind:^(HSDownLoadVoiceCell *cell, HSDownLoadVoiceCellPresenter *model) {
        [model bindWithCell:cell];
    }];
    
}


@end
