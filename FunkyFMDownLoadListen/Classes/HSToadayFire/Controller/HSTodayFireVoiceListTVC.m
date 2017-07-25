//
//  HSTodayFireVoiceListTVC.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/19.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSTodayFireVoiceListTVC.h"
#import "HSTodayFireDataProvider.h"
#import "HSTodayFireVoiceCellPresenter.h"

@interface HSTodayFireVoiceListTVC ()

@property (nonatomic, strong) NSArray<HSTodayFireVoiceCellPresenter *> *presenterMs;

@end

@implementation HSTodayFireVoiceListTVC

-(void)viewDidLoad {
    self.tableView.rowHeight = 80;
    
    // 根据选项卡的 key 值，获取选项卡对应的声音数据
    __weak typeof(self) weakSelf = self;
    [[HSTodayFireDataProvider shareInstance] getTodayFireVoiceMsWithKey:self.loadKey result:^(NSArray<HSDownLoadVoiceModel *> *voiceMs) {
        
        NSMutableArray *presenters = [NSMutableArray array];
        for (HSDownLoadVoiceModel *voiceM in voiceMs) {
            HSTodayFireVoiceCellPresenter *presenter = [[HSTodayFireVoiceCellPresenter alloc] init];
            presenter.voiceM = voiceM;
            [presenters addObject:presenter];
        }
        
        weakSelf.presenterMs = presenters;
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.presenterMs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HSTodayFireVoiceCell *cell = [HSTodayFireVoiceCell cellWithTableView:tableView];
    
    HSTodayFireVoiceCellPresenter *presenter = self.presenterMs[indexPath.row];
    presenter.sortNum = indexPath.row + 1;
    [presenter bindWithCell:cell];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    HSTodayFireVoiceCellPresenter *presenter = self.presenterMs[indexPath.row];
//    
//    NSLog(@"跳转到播放器界面进行播放--%@--", presenter.voiceM.title);
    
}

#pragma mark - setter & getter

- (void)setPresenterMs:(NSArray<HSTodayFireVoiceCellPresenter *> *)presenterMs {
    _presenterMs = presenterMs;
    [self.tableView reloadData];
}

@end
