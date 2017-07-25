//
//  HSDownLoadListernDataTool.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HSAlbumModel.h"
#import "HSDownLoadVoiceModel.h"


@interface HSDownLoadListernDataTool : NSObject


+ (NSArray <HSAlbumModel *>*)getDownLoadedAlbums;


+ (NSArray <HSDownLoadVoiceModel *>*)getDownLoadedVoiceMs;


+ (NSArray <HSDownLoadVoiceModel *>*)getDownLoadingVoiceMs;

+ (NSArray <HSDownLoadVoiceModel *>*)getDownLoadedVoiceMsInAlbumID: (NSInteger)albumID;



@end
