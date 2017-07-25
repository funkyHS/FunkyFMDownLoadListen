//
//  HSNoDownLoadView.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSNoDownLoadView : UIView

+ (instancetype)noDownLoadView;

@property (nonatomic, strong) UIImage *noDataImg;

@property (nonatomic, copy) void(^clickBlock)();

@end
