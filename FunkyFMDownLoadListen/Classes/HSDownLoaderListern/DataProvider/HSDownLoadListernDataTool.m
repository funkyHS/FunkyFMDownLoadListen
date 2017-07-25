//
//  HSDownLoadListernDataTool.m
//  FunkyFMDownLoadListen
//
//  Created by 胡晟 on 2017/7/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSDownLoadListernDataTool.h"
#import "HSSqliteModelTool.h"

@implementation HSDownLoadListernDataTool


+ (NSArray <HSAlbumModel *>*)getDownLoadedAlbums {
    
    NSArray *array = [HSSqliteModelTool queryModels:[HSAlbumModel class] WithSql:@"select albumId, albumTitle, commentsCounts, coverSmall as albumCoverMiddle,nickName as authorName, count(*) as voiceCount, sum(totalSize) as allVoiceSize from HSDownLoadVoiceModel where isDownLoaded = '1' group by albumId" uid:nil];
    
    return array;
}

+ (NSArray <HSDownLoadVoiceModel *>*)getDownLoadedVoiceMs {
    
    return [HSSqliteModelTool queryModels:[HSDownLoadVoiceModel class] columnName:@"isDownLoaded" relation:HSColumnNameToValueRelationTypeEqual value:@(YES) uid:nil];
}

+ (NSArray <HSDownLoadVoiceModel *>*)getDownLoadingVoiceMs {
    
    return [HSSqliteModelTool queryModels:[HSDownLoadVoiceModel class] columnName:@"isDownLoaded" relation:HSColumnNameToValueRelationTypeEqual value:@(NO) uid:nil];
    
}

//+ (NSURL *)getCachePathWithWithURL:(NSString *)url orTrackID: (NSInteger)trackID {
//    
//    
//    NSString *sql = [NSString stringWithFormat:@"select downloadUrl from HSDownLoadVoiceModel where downloadUrl = '%@' or trackId = '%zd'", url, trackID];
//    
//    [HSSqliteModelTool queryModels:<#(__unsafe_unretained Class)#> WithSql:<#(NSString *)#> uid:<#(NSString *)#>];
//    
//    return [HSSqliteModelTool queryModels:[HSDownLoadVoiceModel class] columnName:@"isDownLoaded" relation:HSColumnNameToValueRelationTypeEqual value:@(NO) uid:nil];
//    
//}



+ (NSArray <HSDownLoadVoiceModel *>*)getDownLoadedVoiceMsInAlbumID: (NSInteger)albumID {
    
    return [HSSqliteModelTool queryModels:[HSDownLoadVoiceModel class] columnNames:@[@"isDownLoaded", @"albumID"] relations:@[@(HSColumnNameToValueRelationTypeEqual), @(HSColumnNameToValueRelationTypeEqual)] values:@[@"1", @(albumID)] logics:@[@(HSColumnNameToValueLogicAnd)] uid:nil];
    
}






@end
