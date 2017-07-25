//
//  HSTodayFireDataProvider.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/11.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HSCategoryModel.h"
#import "HSDownLoadVoiceModel.h"

@interface HSTodayFireDataProvider : NSObject

+ (instancetype)shareInstance;

// 获取 今日最火 顶部选项卡
- (void)getTodayFireCategoryMs: (void(^)(NSArray <HSCategoryModel *>*categoryMs))resultBlock;

// 获取 今日最火 列表
- (void)getTodayFireVoiceMsWithKey: (NSString *)key result: (void(^)(NSArray <HSDownLoadVoiceModel *>*voiceMs)) resultBlock;

@end

