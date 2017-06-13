//
//  HSSegmentBarConfig.m
//  FunkySegmentBar
//
//  Created by 胡晟 on 2017/6/12.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSSegmentBarConfig.h"

@implementation HSSegmentBarConfig

+ (instancetype)defaultConfig {
    
    HSSegmentBarConfig *config = [[HSSegmentBarConfig alloc] init];
    config.segmentBarBackColor = [UIColor clearColor];
    config.itemFont = [UIFont systemFontOfSize:15];
    config.itemNormalColor = [UIColor lightGrayColor];
    config.itemSelectColor = [UIColor redColor];
    
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorExtraW = 10;
    
    return config;
    
}



- (HSSegmentBarConfig *(^)(UIColor *))itemNC {
    
    return ^(UIColor *color){
        self.itemNormalColor = color;
        return self;
    };
    
}

-(HSSegmentBarConfig *(^)(UIColor *))itemSC {
    return ^(UIColor *color){
        self.itemSelectColor = color;
        return self;
    };
}

@end
