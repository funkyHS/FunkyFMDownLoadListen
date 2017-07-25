//
//  HSTodayFireVoiceCell.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/19.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSDownLoadVoiceModel;

typedef enum {
    
    HSTodayFireVoiceCellStateWaitDownLoad,
    HSTodayFireVoiceCellStateDownLoading,
    HSTodayFireVoiceCellStateDownLoaded,
    
}HSTodayFireVoiceCellState;

@interface HSTodayFireVoiceCell : UITableViewCell

/** 声音标题 */
@property (weak, nonatomic) IBOutlet UILabel *voiceTitleLabel;
/** 声音作者 */
@property (weak, nonatomic) IBOutlet UILabel *voiceAuthorLabel;
/** 声音播放暂停按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseBtn;
/** 声音排名标签 */
@property (weak, nonatomic) IBOutlet UILabel *sortNumLabel;
/** 声音下载按钮 */
@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;


/** 声音下载的状态 */
@property (nonatomic, assign) HSTodayFireVoiceCellState state;

/** 声音下载block */
@property (nonatomic, strong) void(^downLoadBlock)();
@property (nonatomic, copy) void(^playBlock)(BOOL isPlay);


+ (instancetype)cellWithTableView:(UITableView *)tableView;



@end
