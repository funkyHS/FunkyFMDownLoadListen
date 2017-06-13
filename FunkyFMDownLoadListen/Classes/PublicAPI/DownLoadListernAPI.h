//
//  DownLoadListernAPI.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownLoadListernAPI : NSObject

+ (instancetype)shareInstance;

/**
 获取下载听控制器
 */
- (UIViewController *)getDownLoadListernVC;


@end
