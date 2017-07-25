//
//  HSDownLoadVoiceCellPresenter.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/16.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HSDownLoadVoiceModel.h"
#import "HSDownLoadVoiceCell.h"

@interface HSDownLoadVoiceCellPresenter : NSObject


@property (nonatomic, strong) HSDownLoadVoiceModel *voiceM;



- (void)bindWithCell:(HSDownLoadVoiceCell *)cell;

@end
