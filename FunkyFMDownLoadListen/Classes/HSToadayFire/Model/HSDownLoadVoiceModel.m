//
//  HSDownLoadVoiceModel.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/19.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadVoiceModel.h"
#import "HSModelProtocol.h"


@interface HSDownLoadVoiceModel ()<HSModelProtocol>

@end

@implementation HSDownLoadVoiceModel

+ (NSString *)primaryKey {
    return @"trackId";
}


@end
