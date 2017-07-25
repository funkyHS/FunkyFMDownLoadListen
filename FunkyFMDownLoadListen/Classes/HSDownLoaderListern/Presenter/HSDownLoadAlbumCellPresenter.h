//
//  HSDownLoadAlbumCellPresenter.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HSAlbumModel.h"
#import "HSDownLoadAlbumCell.h"

@interface HSDownLoadAlbumCellPresenter : NSObject

@property (nonatomic, strong) HSAlbumModel *albumModel;

- (void)bindWithCell: (HSDownLoadAlbumCell *)cell;

@end
