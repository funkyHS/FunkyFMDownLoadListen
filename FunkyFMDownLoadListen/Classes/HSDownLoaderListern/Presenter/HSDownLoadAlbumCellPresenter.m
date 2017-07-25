//
//  HSDownLoadAlbumCellPresenter.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadAlbumCellPresenter.h"
#import "UIImageView+WebCache.h"
#import "HSSqliteModelTool.h"
#import "HSDownLoadedVoicInAlbumTVC.h"
#import "UIView+HSNib.h"
#import "HSDownLoadVoiceModel.h"
#import "HSDownLoader.h"

@implementation HSDownLoadAlbumCellPresenter

#pragma mark - 绑定cell
- (void)bindWithCell: (HSDownLoadAlbumCell *)cell {
    
    /** 专辑图片 */
    [cell.albumImageView sd_setImageWithURL:[self imageURL]];
    /** 专辑标题 */
    cell.albumTitleLabel.text = [self title];
    /** 专辑作者 */
    cell.albumAuthorLabel.text = [self author];
    /** 专辑集数 */
    [cell.albumPartsBtn setTitle:[self voiceCount] forState:UIControlStateNormal];
    /** 专辑大小 */
    [cell.albumPartsSizeBtn setTitle:[self totalSize] forState:UIControlStateNormal];
    
    /** 删除按钮点击执行代码块 */
    [cell setDeleteBlock:^{
        
        // 删除资源
        
        NSArray *voiceMs = [HSSqliteModelTool queryModels:NSClassFromString(@"HSDownLoadVoiceModel") columnNames:@[@"albumId", @"isDownLoaded"] relations:@[@(HSColumnNameToValueRelationTypeEqual),@(HSColumnNameToValueRelationTypeEqual)] values:@[@(self.albumModel.albumId), @(YES)] logics:@[@(HSColumnNameToValueLogicAnd)] uid:nil];
        
        for (HSDownLoadVoiceModel *voiceM in voiceMs) {
            [HSDownLoader clearCacheWithURL:[NSURL URLWithString:voiceM.playPathAacv164]];
        }
        
        [HSSqliteModelTool deleteModel:NSClassFromString(@"HSDownLoadVoiceModel") columnName:@"albumId" relation:HSColumnNameToValueRelationTypeEqual value:@(self.albumModel.albumId) uid:nil];
        
        
        // 发送通知, 刷新表格
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadCache" object:nil];
    }];
    
    /** 选中执行代码块 */
    __weak typeof(cell) weakCell = cell;
    __weak typeof(self) weakSelf = self;
    [cell setSelectBlock:^{
                HSDownLoadedVoicInAlbumTVC *vc = [HSDownLoadedVoicInAlbumTVC new];
                vc.albumID = self.albumModel.albumId;
                vc.navigationItem.title = weakSelf.albumModel.albumTitle;
                [weakCell.currentViewController.navigationController pushViewController:vc animated:YES];
    }];
    
}

#pragma mark - 数据展示组织
- (NSURL *)imageURL {
    return [NSURL URLWithString:self.albumModel.albumCoverMiddle];
}
- (NSString *)title {
    return self.albumModel.albumTitle;
}
- (NSString *)author {
    return self.albumModel.authorName;
}
- (NSString *)voiceCount {
    return [NSString stringWithFormat:@"%zd", self.albumModel.voiceCount];
}
- (NSString *)getFormatSizeWithSize: (long long)fileSize {
    NSArray *unit = @[@"B", @"kb", @"M", @"G"];
    
    double tmpSize = fileSize;
    int index = 0;
    while (tmpSize > 1024) {
        tmpSize /= 1024;
        index ++;
    }
    return [NSString stringWithFormat:@"%.1f%@",tmpSize, unit[index]];
}
- (NSString *)totalSize {
    return [self getFormatSizeWithSize:self.albumModel.allVoiceSize];
}


@end
