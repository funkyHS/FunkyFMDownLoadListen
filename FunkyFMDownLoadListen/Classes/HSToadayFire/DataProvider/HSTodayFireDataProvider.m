//
//  HSTodayFireDataProvider.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/11.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSTodayFireDataProvider.h"
#import "HSSessionManager.h"
#import "MJExtension.h"
#import "Base.h"


@interface HSTodayFireDataProvider ()

@property (nonatomic, strong) HSSessionManager *sessionManager;

@end


@implementation HSTodayFireDataProvider

static HSTodayFireDataProvider *_shareInstance;
+ (instancetype)shareInstance {
    if (!_shareInstance) {
        _shareInstance = [[self alloc] init];
    }
    return _shareInstance;
}

- (HSSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[HSSessionManager alloc] init];
    }
    return _sessionManager;
}


- (void)getTodayFireCategoryMs: (void(^)(NSArray <HSCategoryModel *>*categoryMs))resultBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/rankingList/track"];
    NSDictionary *param = @{
                            @"device": @"iPhone",
                            @"key": @"ranking:track:scoreByTime:1:0",
                            @"pageId": @"1",
                            @"pageSize": @"0"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        HSCategoryModel *categoryM = [[HSCategoryModel alloc] init];
        categoryM.key = @"ranking:track:scoreByTime:1:0";
        categoryM.name = @"总榜";
        
        NSMutableArray <HSCategoryModel *>*categoryMs = [HSCategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"categories"]];
        [categoryMs insertObject:categoryM atIndex:0];
        
        resultBlock(categoryMs);
        
    }];
}


- (void)getTodayFireVoiceMsWithKey: (NSString *)key result: (void(^)(NSArray <HSDownLoadVoiceModel *>*voiceMs)) resultBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/rankingList/track"];
    NSDictionary *param = @{
                            @"device": @"iPhone",
                            @"key": key,
                            @"pageId": @"1",
                            @"pageSize": @"30"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        NSMutableArray <HSDownLoadVoiceModel *>*voiceyMs = [HSDownLoadVoiceModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        resultBlock(voiceyMs);
        
    }];
    
    
}

@end
