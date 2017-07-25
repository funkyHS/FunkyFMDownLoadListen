//
//  HSDownLoadVoiceModel.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/19.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSDownLoadVoiceModel : NSObject 





// -----------------专辑相关信息-------------------
/**
 专辑ID
 */
@property (nonatomic, assign) NSInteger albumId;

/**
 专辑名称
 */
@property (nonatomic, copy) NSString *albumTitle;

/**
 评论个数
 */
@property (nonatomic, assign) NSInteger commentsCounts;
/**
 专辑图片
 */
@property (nonatomic, copy) NSString *albumCoverMiddle;


/** -----------------声音相关信息------------------- */


/**
 声音ID
 */
@property (nonatomic, assign) NSInteger trackId;
/**
 标题
 */
@property (nonatomic, copy) NSString *title;
/**
 播放URL
 */
@property (nonatomic, copy) NSString *playPathAacv164;

/**
 播放次数
 */
@property (nonatomic, assign) NSInteger playtimes;

/**
 作者昵称
 */
@property (nonatomic, copy) NSString *nickname;
/**
 覆盖图片(小)
 */
@property (nonatomic, copy) NSString *coverSmall;
/**
 播放总时长
 */
@property (nonatomic, assign) NSInteger duration;

/**
 喜欢的个数
 */
@property (nonatomic, assign) NSInteger favoritesCounts;


/** 是否已经被下载 */
@property (nonatomic, assign) BOOL isDownLoaded;

/** 文件总大小 */
@property (nonatomic, assign) long long totalSize;

@end

// 根据 选项卡分类模型的key 获取的声音 list 列表
/*
list = (
            {
                albumId = 3796637; //专辑ID
                albumTitle = "\U795e\U533b\U5ae1\U5973";// 专辑名称
                commentsCounts = 23;
                coverSmall = "http://fdfs.xmcdn.com/group23/M0B/E2/78/wKgJL1iFRiOwAirzAACfwepPMFM433_web_meduim.jpg"; // 覆盖图片(小)
                createdAt = 1497909508000;
                duration = 1221; // 播放总时长
                favoritesCounts = 149;// 喜欢的个数
                id = 41314840;
                isAuthorized = 0;
                isFree = 0;
                isPaid = 0;
                nickname = "\U5fae\U51c9\U6709\U7231"; // 作者昵称
                playPath32 = "http://fdfs.xmcdn.com/group28/M03/8D/0B/wKgJSFlISRqRZN3vAEqOaEfOrrw452.mp3";
                playPath64 = "http://fdfs.xmcdn.com/group28/M0B/8E/A6/wKgJXFlISSHTsgdOAJUch6pszLo316.mp3";
                playPathAacv164 = "http://audio.xmcdn.com/group28/M05/8D/0B/wKgJSFlISS6SnxSIAJbmZ3yjemg530.m4a"; // 播放URL
                playPathAacv224 = "http://audio.xmcdn.com/group28/M0B/8E/A5/wKgJXFlISRnyGPS_ADmzygVSStc468.m4a";
                playsCounts = 41990;
                priceTypeId = 0;
                sampleDuration = 0;
                sharesCounts = 0;
                tags = "\U8a00\U60c5,\U7a7f\U8d8a";
                title = "\U65e9\U5b89~\U7b2c789\U7ae0 \U8001\U5b50\U6740\U4f60\U5168\U5bb6";// 声音标题
                trackId = 41314840;// 声音ID
                uid = 15333924; // 请求uid
                updatedAt = 1497913835000;
                userSource = 1;
            }
        )
*/


// 当点击cell上的下载按钮，请求到的声音详细数据
/*
{
    albumCoverMiddle = "http://fdfs.xmcdn.com/group23/M09/E2/4B/wKgJNFiFRh_C5ltxAACfwepPMFM021_mobile_meduim.jpg";// 专辑图片
    albumCoverSmall = "http://fdfs.xmcdn.com/group23/M09/E2/4B/wKgJNFiFRh_C5ltxAACfwepPMFM021_mobile_small.jpg";
    albumId = 3796637;
    albumTitle = "\U795e\U533b\U5ae1\U5973";
    coverSmall = "http://fdfs.xmcdn.com/group23/M0B/E2/78/wKgJL1iFRiOwAirzAACfwepPMFM433_mobile_small.jpg";
    createdAt = 1497909508000;
    downloadAacSize = 3781578;
    downloadAacUrl = "http://download.xmcdn.com/group28/M0B/8E/A5/wKgJXFlISRnyGPS_ADmzygVSStc468.m4a";
    downloadSize = 4886875; // 下载大小
    downloadTime = 1498030132305;
    downloadType = 0;
    downloadUrl = "http://download.xmcdn.com/group28/M0B/8E/A6/wKgJXFlISRyxQxJbAEqRW1IyIdY530.aac"; // 下载地址
    duration = 1221;
    isAuthorized = 0;
    isFree = 0;
    isPaid = 0;
    msg = 0;
    nickname = "\U5fae\U51c9\U6709\U7231";
    orderNum = 788;
    ret = 0;
    sequnceId = f2e4c5f9ef5145109321ba80046eb0a5;
    serialState = 0;
    smallLogo = "http://fdfs.xmcdn.com/group19/M06/E3/D1/wKgJK1fOf_mwDhM4AAJhW7VXVdM025_mobile_small.jpg";
    timeline = 1498030132305;
    title = "\U65e9\U5b89~\U7b2c789\U7ae0 \U8001\U5b50\U6740\U4f60\U5168\U5bb6";
    trackId = 41314840;
    uid = 15333924;
}

*/



/*
 // 点击执行代码块
 //@property (nonatomic, copy) void(^clickBlock)();
 // 删除执行代码块
 //@property (nonatomic, copy) void(^deleteBlock)();
 // 点击下载代码块
 //@property (nonatomic, copy) void(^downLoadBlock)(BOOL isDownLoad);
 
 //------------- 根据选项卡分类模型的key获取的声音list列表存入信息 ----------//
 
 // --> 专辑ID
 @property (nonatomic, assign) NSInteger albumId;
 // --> 专辑名称
 @property (nonatomic, copy) NSString *albumTitle;
 // --> 声音ID
 @property (nonatomic, assign) NSInteger trackId;
 // --> 标题
 @property (nonatomic, copy) NSString *title;
 // --> 播放URL
 @property (nonatomic, copy) NSString *playPathAacv164;
 // --> 播放次数
 @property (nonatomic, assign) NSInteger playtimes;
 // --> 作者昵称
 @property (nonatomic, copy) NSString *nickname;
 // --> 覆盖图片(小)
 @property (nonatomic, copy) NSString *coverSmall;
 // --> 播放总时长
 @property (nonatomic, assign) NSInteger duration;
 // --> 喜欢的个数
 @property (nonatomic, assign) NSInteger favoritesCounts;
 // --> 请求uid
 @property (nonatomic, assign) NSInteger uid;
 // 排名 （根据cell的row来进行赋值）
 @property (nonatomic, assign) NSInteger sortNum;
 
 
 //-------------- 当点击cell上的下载按钮，请求到的声音详细数据 -------------//
 
 // ==> 专辑图片
 @property (nonatomic, copy) NSString *albumCoverMiddle;
 // ==> 下载大小
 @property (nonatomic, assign) NSInteger downloadSize;
 // ==> 下载的URL
 @property (nonatomic, copy) NSString *downloadUrl;
 
 
 
 // -----------------专辑相关信息------------------- //
 
 // 评论个数
 @property (nonatomic, assign) NSInteger comments;
 
 
 // -----------------附加信息------------------- //
 
 // 是否已经下载
 @property (nonatomic, assign) BOOL isDownLoaded;
 
 // 下载进度
 @property (nonatomic, assign) float downLoadProgress;
 
 // 是否正在下载
 @property (nonatomic, assign) BOOL isDownLoading;
 
 // 格式化后的文件总大小
 @property (nonatomic, copy, readonly) NSString *fileFormatSize;
 
 // 格式化后的文件已下载大小
 @property (nonatomic, copy, readonly) NSString *downLoadFormatSize;
 */








