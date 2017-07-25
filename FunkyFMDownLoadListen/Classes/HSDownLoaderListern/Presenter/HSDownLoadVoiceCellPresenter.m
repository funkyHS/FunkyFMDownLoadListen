//
//  HSDownLoadVoiceCellPresenter.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/16.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadVoiceCellPresenter.h"
#import "UIButton+WebCache.h"
#import "HSPlayerService.h"
#import "HSSqliteModelTool.h"
#import "HSDownLoadManager.h"


@interface HSDownLoadVoiceCellPresenter ()

@property (nonatomic, weak) HSDownLoadVoiceCell *cell;

@property (nonatomic, weak) NSTimer *updateTimer;


@end

@implementation HSDownLoadVoiceCellPresenter

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.updateTimer invalidate];
    self.updateTimer = nil;
}
- (instancetype)init {
    if (self = [super init]) {
        
        [self updateTimer];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(remotePlayStateChange:) name:kRemotePlayerURLOrStateChangeNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localPlayStateChange:) name:kLocalPlayerURLOrStateChangeNotification object:nil];
    }
    return self;
}

#pragma mark - 绑定cell
- (void)bindWithCell: (HSDownLoadVoiceCell *)cell {
    
    self.cell = cell;
    
    /** 声音标题 */
    cell.voiceTitleLabel.text = self.title;
    /** 声音作者 */
    cell.voiceAuthorLabel.text = self.author;
    /** 声音播放次数 */
    [cell.voicePlayCountBtn setTitle:self.playCount forState:UIControlStateNormal];
    /** 声音评论次数 */
    [cell.voiceCommentBtn setTitle:self.commentCount forState:UIControlStateNormal];
    /** 声音时长 */
    [cell.voiceDurationBtn setTitle:self.duration forState:UIControlStateNormal];
    [cell.playOrPauseBtn sd_setBackgroundImageWithURL:self.imageURL forState:UIControlStateNormal];
    
    self.cell.playOrPauseBtn.selected = self.isPlaying;
    
    /** 声音下载进度背景(需要控制隐藏显示) */
    cell.progressBackView.hidden = self.isDownLoaded;
    
    [self update];
    
    
    /** 选中执行代码块 */
    [cell setSelectBlock:^{
        NSLog(@"选中了这个cell");
    }];
    
    /** 播放执行代码块 */
    [cell setPlayBlock:^(BOOL isPlaying) {
        
        if (isPlaying) {
            
            [[HSPlayerService shareInstance] playWithURL:[self playURL] isCache:NO withStateBlock:nil];
            
        }else {
            [[HSPlayerService shareInstance] pauseCurrentAudio];
        }
        
    }];
    
    /** 删除执行代码块 */
    [cell setDeleteBlock:^{
        
        // 如果正在播放, 停止播放
        if ([self isPlaying]) {
            [[HSPlayerService shareInstance] pauseCurrentAudio];
        }
        
        // 清理记录
        [HSSqliteModelTool deleteModel:self.voiceM uid:nil];
        
        // 取消下载
        [[HSDownLoadManager shareInstance] cacelAndCleanWithURL:[self playAndDownLoadURL]];
        
        // 清理下载文件
        [HSDownLoader clearCacheWithURL:[self playAndDownLoadURL]];
        
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadCache" object:nil];
    }];
    
    /** 下载或暂停下载代码块 */
    __weak typeof(self) weakSelf = self;
    [cell setDownLoadBlock:^(BOOL isDownLoad) {
        
        __strong typeof(weakSelf.voiceM) strongVoiceM = weakSelf.voiceM;
        
        if (isDownLoad) {
            
            [[HSDownLoadManager shareInstance] downLoader:[self playAndDownLoadURL] downLoadInfo:nil progress:^(float progress) {
                
                /** 声音下载进度条 */
                weakSelf.cell.downLoadProgressV.progress = progress;
                
            } success:^(NSString *filePath) {
                strongVoiceM.isDownLoaded = YES;
                [HSSqliteModelTool saveOrUpdateModel:strongVoiceM uid:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadCache" object:nil];
            } failed:nil];
            
            
        }else {
            
            [[HSDownLoadManager shareInstance] pauseWithURL:self.playAndDownLoadURL];
        }
    }];
    
    
    
    

}


#pragma mark - 定时器更新数据
- (void)update {
    
    /** 声音播放进度 */
    //self.cell.voicePlayProgressLabel.text = self.playProgress;
    
    /** 声音播放暂停按钮 */
    //self.cell.playOrPauseBtn.selected = self.isPlaying;
    
    /** 声音下载或者暂停按钮 */
    self.cell.downLoadOrPauseBtn.selected = self.isDownLoading;
    
    /** 声音下载进度条 */
    self.cell.downLoadProgressV.progress = self.downLoadProgress;
    
    /** 声音下载进度label */
    self.cell.progressLabel.text = self.progressStr;
}


#pragma mark - 数据展示组织
- (NSString *)title {
    return self.voiceM.title;
}
- (NSString *)author {
    return self.voiceM.nickname;
}
- (NSString *)playCount {
    return [NSString stringWithFormat:@"%zd", self.voiceM.favoritesCounts];
}
- (NSString *)commentCount {
    return [NSString stringWithFormat:@"%zd", self.voiceM.commentsCounts];
}
- (NSString *)duration {
    return [NSString stringWithFormat:@"%02zd:%02zd", self.voiceM.duration / 60, self.voiceM.duration % 60];
}
- (NSURL *)imageURL {
    return [NSURL URLWithString:self.voiceM.coverSmall];
}
- (BOOL)isDownLoaded {
    return self.voiceM.isDownLoaded;
}
- (NSURL *)playAndDownLoadURL {
    return [NSURL URLWithString:self.voiceM.playPathAacv164];
}
- (NSURL *)playURL {

    if ([self isDownLoaded]) {
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:self.voiceM.playPathAacv164.lastPathComponent];
        return [NSURL fileURLWithPath:path];;
    }else{
        return [NSURL URLWithString:self.voiceM.playPathAacv164];
    }
}
- (BOOL)isPlaying {
    if ([self.playURL isEqual:[HSPlayerService shareInstance].currentPlayURL]) {
        HSPlayerState state = [HSPlayerService shareInstance].state;
        return state == HSPlayerStatePlaying;
    }
    return NO;
}
- (NSString *)playProgress {
    return @"";
}
- (float)downLoadProgress {
    
    // 如果当前有下载器在下载, 则直接获取
    // 如果没有, 则需要获取文件总大小, 以及本地的当前缓存大小
    return 1.0 * [HSDownLoader tmpCacheSizeWithURL:self.playAndDownLoadURL] / self.voiceM.totalSize;
    
}
- (NSString *)progressStr {
    NSString *totalSize = [self getFormatSizeWithSize:self.voiceM.totalSize];
    NSString *currentSize = [self getFormatSizeWithSize:self.voiceM.totalSize * self.downLoadProgress];
    
    return  [NSString stringWithFormat:@"%@/%@", currentSize, totalSize];
    //    return @"xx";
    
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
- (BOOL)isDownLoading {
    
    HSDownLoader *downLoader = [[HSDownLoadManager shareInstance] getDownLoaderWithURL:self.playAndDownLoadURL];
    if (downLoader) {
        
        HSDownLoadState state = downLoader.state;
        return state == HSDownLoadStateDownLoading;
    }
    return NO;
}


#pragma mark - 收到通知处理
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
    
    if (![[self playAndDownLoadURL] isEqual:url]) {
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


#pragma mark - 懒加载
- (NSTimer *)updateTimer {
    if (!_updateTimer) {
        NSTimer *timer = [NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(update) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        _updateTimer = timer;
    }
    return _updateTimer;
}

@end
