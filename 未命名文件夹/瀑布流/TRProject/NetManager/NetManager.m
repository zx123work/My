//
//  NetManager.m
//  TRProject
//
//  Created by tarena on 16/7/14.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NetManager.h"

#define kBeautyPath @"http://box.dwstatic.com/apiAlbum.php?action=l&albumsTag=beautifulWoman&p=%ld&v=77&OSType=iOS8.2&versionName=2.1.7"

@implementation NetManager
+ (id)getBeautyWithPage:(NSInteger)page completionHandler:(void (^)(TRBeautyModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kBeautyPath, page];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([TRBeautyModel parse:responseObj], error);
    }];
}
@end












