//
//  HSTodayFireVoiceCellPresenter.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/11.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSTodayFireVoiceCellPresenter.h"
#import "UIButton+WebCache.h"
#import "HSDownLoadManager.h"
#import "HSPlayerService.h"
#import "HSSqliteModelTool.h"

@interface HSTodayFireVoiceCellPresenter ()

@property (nonatomic, weak) HSTodayFireVoiceCell *cell;

@end


@implementation HSTodayFireVoiceCellPresenter

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (instancetype)init {
    if (self = [super init]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadStateChange:) name:kDownLoadURLOrStateChangeNotification object:nil];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(remotePlayStateChange:) name:kRemotePlayerURLOrStateChangeNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localPlayStateChange:) name:kLocalPlayerURLOrStateChangeNotification object:nil];
    }
    return self;
}

#pragma mark - 绑定cell
- (void)bindWithCell: (HSTodayFireVoiceCell *)cell {
    
    self.cell = cell;
    
    cell.voiceTitleLabel.text = [self title];
    cell.voiceAuthorLabel.text = [self authorName];
    [cell.playOrPauseBtn sd_setBackgroundImageWithURL:[self voiceURL]  forState:UIControlStateNormal];
    cell.sortNumLabel.text = [self sortNumStr];
    
    // 动态判断下载状态
    cell.state = [self cellDownLoadState];
    
    // 动态判断播放状态
    cell.playOrPauseBtn.selected = [self isPlaying];
    
    
    // 播放或暂停按钮点击
    [cell setPlayBlock:^(BOOL isPlay) {
        
        if (isPlay) {
            
            [[HSPlayerService shareInstance] playWithURL:[self playURL] isCache:NO withStateBlock:nil];
        }else {
            
            [[HSPlayerService shareInstance] pauseCurrentAudio];
        }
    }];
    
    
    // 下载按钮点击
    __weak typeof(self) weakSelf = self;
    [cell setDownLoadBlock:^{
        __strong typeof(weakSelf.voiceM) strongVoiceM = weakSelf.voiceM;
        
        [[HSDownLoadManager shareInstance] downLoader:[self playOrDownLoadURL] downLoadInfo:^(long long totalSize) {
            
            strongVoiceM.totalSize = totalSize;
            [HSSqliteModelTool saveOrUpdateModel:strongVoiceM uid:nil];
            
        } progress:nil success:^(NSString *filePath) {
            
            strongVoiceM.isDownLoaded = YES;
            [HSSqliteModelTool saveOrUpdateModel:strongVoiceM uid:nil];

            // 下载成功的通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadCache" object:nil];
            
        } failed:nil];
        
    }];
    
}

#pragma mark - 数据展示组织
- (NSURL *)playURL {
    
    if ([self cellDownLoadState] == HSTodayFireVoiceCellStateDownLoaded) {
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:self.voiceM.playPathAacv164.lastPathComponent];
        return [NSURL fileURLWithPath:path];;
    }else{
        return [NSURL URLWithString:self.voiceM.playPathAacv164];
    }
}
- (NSString *)title {
    return self.voiceM.title;
}
- (NSString *)authorName {
    return [NSString stringWithFormat:@"by %@", self.voiceM.nickname];
}
- (NSURL *)voiceURL {
    return [NSURL URLWithString:self.voiceM.coverSmall];
}
- (NSString *)sortNumStr {
    return [NSString stringWithFormat:@"%zd", self.sortNum];
}
- (NSURL *)playOrDownLoadURL {
    return [NSURL URLWithString:self.voiceM.playPathAacv164];
}
- (HSTodayFireVoiceCellState)cellDownLoadState {
    
    HSDownLoader *downLoader = [[HSDownLoadManager shareInstance] getDownLoaderWithURL:[self playOrDownLoadURL]];
    
    if (downLoader.state == HSDownLoadStateDownLoading) {
        
        return  HSTodayFireVoiceCellStateDownLoading;
        
    }else if (downLoader.state == HSDownLoadStatePauseSuccess  || [HSDownLoader downLoadedFileWithURL:[self playOrDownLoadURL]].length > 0) {
        
        return   HSTodayFireVoiceCellStateDownLoaded;
        
    }else {
        return  HSTodayFireVoiceCellStateWaitDownLoad;
    }
    
}
- (BOOL)isPlaying {
    
    if ([[self playURL] isEqual:[HSPlayerService shareInstance].currentPlayURL]) {
        HSPlayerState state = [HSPlayerService shareInstance].state;
        if (state == HSPlayerStatePlaying || state == HSPlayerStateLoading) {
            return YES;
        }else {
            return NO;
        }
    }else {
        return NO;
    }
}


#pragma mark - 收到通知处理
- (void)downLoadStateChange: (NSNotification *)notice {
    
    NSDictionary *dic = notice.userInfo;
    NSString *url = dic[@"downLoadURL"];
    if (![url isEqual:self.playOrDownLoadURL]) {
        return;
    }
    
    self.cell.state = [self cellDownLoadState];
}
- (void)localPlayStateChange: (NSNotification *)notice {
    
    NSDictionary *noticeDic = notice.userInfo;
    NSURL *url = noticeDic[@"playURL"];
    
    if (![[self playURL] isEqual:url]) {
        self.cell.playOrPauseBtn.selected = NO;
        return;
    }
    
    BOOL state = [noticeDic[@"playState"] integerValue];
    if (state == YES) {
        self.cell.playOrPauseBtn.selected = YES;
    }else {
        self.cell.playOrPauseBtn.selected = NO;
    }
    
}
- (void)remotePlayStateChange: (NSNotification *)notice {
    
    NSDictionary *noticeDic = notice.userInfo;
    NSURL *url = noticeDic[@"playURL"];
    
    if (![[self playOrDownLoadURL] isEqual:url]) {
        self.cell.playOrPauseBtn.selected = NO;
        return;
    }
    
    HSPlayerState state = [noticeDic[@"playState"] integerValue];
    if (state == HSPlayerStatePlaying || state == HSPlayerStateLoading) {
        self.cell.playOrPauseBtn.selected = YES;
    }else {
        self.cell.playOrPauseBtn.selected = NO;
    }
    
}




@end
