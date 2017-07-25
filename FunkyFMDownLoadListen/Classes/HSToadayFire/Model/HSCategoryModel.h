//
//  HSCategoryModel.h
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/6/19.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSCategoryModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *name;

@end

/*
categories =     (
                  {
                      id = 3;
                      key = "1_3_ranking:track:scoreByTime:1:3";
                      name = "\U6709\U58f0\U4e66";
                  },
                  {
                      id = 2;
                      key = "1_2_ranking:track:scoreByTime:1:2";
                      name = "\U97f3\U4e50";
                  },
                  {
                      id = 4;
                      key = "1_4_ranking:track:scoreByTime:1:4";
                      name = "\U5a31\U4e50";
                  },
                  {
                      id = 12;
                      key = "1_12_ranking:track:scoreByTime:1:12";
                      name = "\U76f8\U58f0\U8bc4\U4e66";
                  },
                  {
                      id = 6;
                      key = "1_6_ranking:track:scoreByTime:1:6";
                      name = "\U513f\U7ae5";
                  },
                  {
                      id = 1;
                      key = "1_1_ranking:track:scoreByTime:1:1";
                      name = "\U5934\U6761";
                  },
                  {
                      id = 10;
                      key = "1_10_ranking:track:scoreByTime:1:10";
                      name = "\U60c5\U611f\U751f\U6d3b";
                  },
                  {
                      id = 9;
                      key = "1_9_ranking:track:scoreByTime:1:9";
                      name = "\U5386\U53f2";
                  },
                  {
                      id = 5;
                      key = "1_5_ranking:track:scoreByTime:1:5";
                      name = "\U5916\U8bed";
                  },
                  {
                      id = 13;
                      key = "1_13_ranking:track:scoreByTime:1:13";
                      name = "\U6559\U80b2\U57f9\U8bad";
                  },
                  {
                      id = 14;
                      key = "1_14_ranking:track:scoreByTime:1:14";
                      name = "\U767e\U5bb6\U8bb2\U575b";
                  },
                  {
                      id = 15;
                      key = "1_15_ranking:track:scoreByTime:1:15";
                      name = "\U5e7f\U64ad\U5267";
                  },
                  {
                      id = 16;
                      key = "1_16_ranking:track:scoreByTime:1:16";
                      name = "\U620f\U66f2";
                  },
                  {
                      id = 8;
                      key = "1_8_ranking:track:scoreByTime:1:8";
                      name = "\U5546\U4e1a\U8d22\U7ecf";
                  },
                  {
                      id = 18;
                      key = "1_18_ranking:track:scoreByTime:1:18";
                      name = "IT\U79d1\U6280";
                  },
                  {
                      id = 7;
                      key = "1_7_ranking:track:scoreByTime:1:7";
                      name = "\U5065\U5eb7\U517b\U751f";
                  },
                  {
                      id = 20;
                      key = "1_20_ranking:track:scoreByTime:1:20";
                      name = "\U6821\U56ed";
                  },
                  {
                      id = 22;
                      key = "1_22_ranking:track:scoreByTime:1:22";
                      name = "\U65c5\U6e38";
                  },
                  {
                      id = 21;
                      key = "1_21_ranking:track:scoreByTime:1:21";
                      name = "\U6c7d\U8f66";
                  },
                  {
                      id = 24;
                      key = "1_24_ranking:track:scoreByTime:1:24";
                      name = "\U52a8\U6f2b\U6e38\U620f";
                  },
                  {
                      id = 23;
                      key = "1_23_ranking:track:scoreByTime:1:23";
                      name = "\U7535\U5f71";
                  },
                  {
                      id = 31;
                      key = "1_31_ranking:track:scoreByTime:1:31";
                      name = "\U65f6\U5c1a\U751f\U6d3b";
                  }
                  );

*/
