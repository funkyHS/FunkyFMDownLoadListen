//
//  HSTodayFireVoiceCell.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/19.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSTodayFireVoiceCell.h"

@implementation HSTodayFireVoiceCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    HSTodayFireVoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HSTodayFireVoiceCellId"];
    
    if (cell == nil) {
        
        cell = [[[NSBundle bundleForClass:self] loadNibNamed:@"HSTodayFireVoiceCell" owner:nil options:nil] firstObject];
        [cell addObserver:cell forKeyPath:@"sortNumLabel.text" options:NSKeyValueObservingOptionNew context:nil];
    }
    
    return cell;
}

-(void)dealloc {
    [self removeObserver:self forKeyPath:@"sortNumLabel.text"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
    self.playOrPauseBtn.layer.masksToBounds = YES;
    self.playOrPauseBtn.layer.borderWidth = 3;
    self.playOrPauseBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.playOrPauseBtn.layer.cornerRadius = 20;

}


// 下载按钮点击
- (IBAction)downLoad {
    
    if (self.downLoadBlock && self.state == HSTodayFireVoiceCellStateWaitDownLoad) {
        NSLog(@"下载");
        self.downLoadBlock();
    }
}


// 播放或暂停按钮点击
- (IBAction)playOrPause:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    NSLog(@"播放/暂停");
    if (self.playBlock) {
        self.playBlock(sender.selected);
    }
    
}


// 设置下载状态（未下载，已下载，下载中）
- (void)setState:(HSTodayFireVoiceCellState)state {
    
    
    NSBundle *currentnBundle = [NSBundle bundleForClass:[self class]];
    
    NSDictionary *bundleInfoDic = currentnBundle.infoDictionary;
    NSString *bundleName = bundleInfoDic[@"CFBundleName"];

    
    
    _state = state;
    switch (state) {
        case HSTodayFireVoiceCellStateWaitDownLoad:
        {
            NSLog(@"等待下载");
            [self removeRotationAnimation];
            
            NSString *downloadedPath = [currentnBundle pathForResource:@"cell_download.png" ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle", bundleName]];
            [self.downLoadBtn setImage:[UIImage imageWithContentsOfFile:downloadedPath] forState:UIControlStateNormal];
            
            //[self.downLoadBtn setImage:[UIImage imageNamed:@"cell_download"] forState:UIControlStateNormal];
        }
            break;
        case HSTodayFireVoiceCellStateDownLoading:
        {
            NSLog(@"正在下载");
            
            NSString *downloadedingPath = [currentnBundle pathForResource:@"cell_download_loading@2x.png" ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle", bundleName]];
            [self.downLoadBtn setImage:[UIImage imageWithContentsOfFile:downloadedingPath] forState:UIControlStateNormal];
            //[self.downLoadBtn setImage:[UIImage imageNamed:@"cell_download_loading"] forState:UIControlStateNormal];
            [self addRotationAnimation];
            break;
        }
        case HSTodayFireVoiceCellStateDownLoaded:
        {
            NSLog(@"下载完毕");
            [self removeRotationAnimation];
            NSString *downloadededPath = [currentnBundle pathForResource:@"cell_downloaded@2x.png" ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle", bundleName]];
            [self.downLoadBtn setImage:[UIImage imageWithContentsOfFile:downloadededPath] forState:UIControlStateNormal];
            //[self.downLoadBtn setImage:[UIImage imageNamed:@"cell_downloaded"] forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    
}

- (void)addRotationAnimation {
    [self removeRotationAnimation];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(M_PI * 2.0);
    animation.duration = 10;
    animation.removedOnCompletion = NO;
    animation.repeatCount = MAXFLOAT;
    [self.downLoadBtn.imageView.layer addAnimation:animation forKey:@"rotation"];
    
}

- (void)removeRotationAnimation {
    
    [self.downLoadBtn.imageView.layer removeAllAnimations];
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"sortNumLabel.text"]) {
        NSInteger sort = [change[NSKeyValueChangeNewKey] integerValue];
        if (sort == 1) {
            self.sortNumLabel.textColor = [UIColor redColor];
        }else if (sort == 2) {
            self.sortNumLabel.textColor = [UIColor orangeColor];
        }else if (sort == 3) {
            self.sortNumLabel.textColor = [UIColor greenColor];
        }else {
            self.sortNumLabel.textColor = [UIColor grayColor];
        }
        return;
    }
    
}

@end
