//
//  HSDownLoadVoiceCell.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/16.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadVoiceCell.h"

@implementation HSDownLoadVoiceCell

static NSString *const cellID = @"downLoadVoice";

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    HSDownLoadVoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:self] loadNibNamed:@"HSDownLoadVoiceCell" owner:nil options:nil] firstObject];
    }
    
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.playOrPauseBtn.layer.cornerRadius = 20;
    self.playOrPauseBtn.layer.masksToBounds = YES;
    self.playOrPauseBtn.layer.borderWidth = 3;
    self.playOrPauseBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
    
}

- (IBAction)playOrPause:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.playBlock) {
        self.playBlock(sender.selected);
    }
    
}

- (IBAction)downLoadOrPause:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (self.downLoadBlock) {
        self.downLoadBlock(sender.selected);
    }
    
}
- (IBAction)deleteFile {
    
    if (self.deleteBlock) {
        self.deleteBlock();
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
        if (self.selectBlock) {
            self.selectBlock();
        }
    }
}


@end
