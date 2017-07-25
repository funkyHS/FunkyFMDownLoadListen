//
//  HSAlbumTVC.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSAlbumTVC.h"
#import "HSDownLoadListernDataTool.h"
#import "HSDownLoadAlbumCellPresenter.h"
#import "HSDownLoadAlbumCell.h"

@interface HSAlbumTVC ()

@end

@implementation HSAlbumTVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadCache];
}

- (void)reloadCache {
    
    NSArray <HSAlbumModel *>*albumMs = [HSDownLoadListernDataTool getDownLoadedAlbums];
    
    NSMutableArray <HSDownLoadAlbumCellPresenter *>*presenters = [NSMutableArray arrayWithCapacity:albumMs.count];
    for (HSAlbumModel *albumM in albumMs) {
        HSDownLoadAlbumCellPresenter *presenter = [HSDownLoadAlbumCellPresenter new];
        presenter.albumModel = albumM;
        [presenters addObject:presenter];
    }
    
    
    
    [self setUpWithDataSouce:presenters getCell:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        return [HSDownLoadAlbumCell cellWithTableView:tableView];
    } cellHeight:^CGFloat(id model) {
        return 80;
    } bind:^(HSDownLoadAlbumCell *cell, HSDownLoadAlbumCellPresenter *model) {
        [model bindWithCell:cell];
    }];
    
}


@end
