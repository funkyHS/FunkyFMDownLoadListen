//
//  HSNoDownLoadView.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    HSNoDownLoadViewNoDownLoaded,
    HSNoDownLoadViewNoDownLoading
}HSNoDownLoadViewType;


@interface HSNoDownLoadView : UIView

+ (instancetype)noDownLoadViewWithType: (HSNoDownLoadViewType)type;

@property (nonatomic, copy) void(^clickBlock)();

@end
