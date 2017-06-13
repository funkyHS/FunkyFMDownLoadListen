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


+ (instancetype)noDownLoadViewWithType: (HSNoDownLoadViewType)type {
    
    
    //HSNoDownLoadView *noDataView = [[[NSBundle mainBundle] loadNibNamed:@"HSNoDownLoadView" owner:nil options:nil] firstObject];
    
    NSBundle *_currentBundle = [NSBundle bundleForClass:self];
    
    HSNoDownLoadView *noDataView = [[_currentBundle loadNibNamed:@"HSNoDownLoadView" owner:nil options:nil] firstObject];
    
    NSString *bundleName = [[_currentBundle bundleIdentifier].pathExtension stringByAppendingString:@".bundle"];
    
    
    
    if (type == HSNoDownLoadViewNoDownLoaded) {
        NSString *downLoadedPath = [_currentBundle pathForResource:@"noData_download.png" ofType:nil inDirectory:bundleName];
        noDataView.noDataImageView.image = [UIImage imageWithContentsOfFile:downLoadedPath];
        
        //noDataView.noDataImageView.image = [UIImage imageNamed:@"noData_download.png"];
        
    }else if(type == HSNoDownLoadViewNoDownLoading)
    {
        NSString *downLoadedPath = [_currentBundle pathForResource:@"noData_downloading@3x.png" ofType:nil inDirectory:bundleName];
        noDataView.noDataImageView.image = [UIImage imageWithContentsOfFile:downLoadedPath];
        
        //noDataView.noDataImageView.image = [UIImage imageNamed:@"noData_downloading@3x.png"];

        
    }
    return noDataView;
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
