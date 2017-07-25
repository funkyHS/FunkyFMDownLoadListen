//
//  HSDownLoadBaseTVC.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UITableViewCell *(^GetCellBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat (^GetHeightBlock)(id model);
typedef void (^BindBlock)(__kindof UITableViewCell *cell, id model);


@interface HSDownLoadBaseTVC : UITableViewController

- (void)setUpWithDataSouce: (NSArray *)dataSource getCell: (GetCellBlock)cellBlock cellHeight: (GetHeightBlock)cellHeightBlock bind: (BindBlock)bindBlock;


@end
