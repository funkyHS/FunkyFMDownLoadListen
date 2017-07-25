//
//  HSDownLoadAlbumCell.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadAlbumCell.h"

@implementation HSDownLoadAlbumCell

static NSString *const cellID = @"downLoadAlbum";

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    HSDownLoadAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:self] loadNibNamed:@"HSDownLoadAlbumCell" owner:nil options:nil] firstObject];
    }
    
    return cell;
}

- (IBAction)delete {
    
    if (self.deleteBlock) {
        self.deleteBlock();
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        if (self.selectBlock) {
            self.selectBlock();
        }
    }
}



@end
