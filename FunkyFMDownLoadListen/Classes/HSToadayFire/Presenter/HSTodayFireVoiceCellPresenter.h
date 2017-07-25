//
//  HSTodayFireVoiceCellPresenter.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/11.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HSDownLoadVoiceModel.h"
#import "HSTodayFireVoiceCell.h"


@interface HSTodayFireVoiceCellPresenter : NSObject


@property (nonatomic, strong) HSDownLoadVoiceModel *voiceM;

@property (nonatomic, assign) NSInteger sortNum;

- (void)bindWithCell: (HSTodayFireVoiceCell *)cell;


@end
