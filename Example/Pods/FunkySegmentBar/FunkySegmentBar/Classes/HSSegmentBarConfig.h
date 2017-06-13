//
//  HSSegmentBarConfig.h
//  FunkySegmentBar
//
//  Created by 胡晟 on 2017/6/12.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSSegmentBarConfig : NSObject


+ (instancetype)defaultConfig;

/** 背景颜色 */
@property (nonatomic, strong) UIColor *segmentBarBackColor;

/** 选项颜色(普通) */
@property (nonatomic, strong) UIColor *itemNormalColor;

/** 选项颜色(选中) */
@property (nonatomic, strong) UIColor *itemSelectColor;

/** 选项字体 */
@property (nonatomic, strong) UIFont *itemFont;

/** 指示器颜色, 默认红色 */
@property (nonatomic, strong) UIColor *indicatorColor;

/** 指示器高度 */
@property (nonatomic, assign) CGFloat indicatorHeight;

/** 指示器的额外宽度(在跟随字体宽度之外的额外宽度) */
@property (nonatomic, assign) CGFloat indicatorExtraW;


// 链式编程的改法
- (HSSegmentBarConfig *(^)(UIColor *color))itemNC;
- (HSSegmentBarConfig *(^)(UIColor *color))itemSC;



@end

