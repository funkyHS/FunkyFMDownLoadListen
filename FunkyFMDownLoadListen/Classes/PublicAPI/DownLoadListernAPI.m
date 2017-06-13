//
//  DownLoadListernAPI.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "DownLoadListernAPI.h"
#import "HSDownLoadListenVC.h"

@implementation DownLoadListernAPI

static DownLoadListernAPI *_shareInstance;

+ (instancetype)shareInstance {
    
    if (_shareInstance == nil) {
        _shareInstance = [[DownLoadListernAPI alloc] init];
    }
    return _shareInstance;
}


- (UIViewController *)getDownLoadListernVC {
    
    return [HSDownLoadListenVC new];
    
    
}



@end
