//
//  HSNoDownLoadView.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSNoDownLoadView.h"

@interface HSNoDownLoadView ()
@property (weak, nonatomic) IBOutlet UIImageView *noDataImageView;

@end

@implementation HSNoDownLoadView


+ (instancetype)noDownLoadView {
    
    NSBundle *_currentBundle = [NSBundle bundleForClass:self];
    HSNoDownLoadView *noDataView = [[_currentBundle loadNibNamed:@"HSNoDownLoadView" owner:nil options:nil] firstObject];
    return noDataView;
}

- (void)setNoDataImg:(UIImage *)noDataImg {
    _noDataImg = noDataImg;
    self.noDataImageView.image = noDataImg;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (IBAction)goView {
    if (self.clickBlock != nil) {
        self.clickBlock();
    }
}

@end
