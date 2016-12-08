//
//  NetManager.h
//  TRProject
//
//  Created by tarena on 16/7/14.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "BaseNetworking.h"
#import "TRBeautyModel.h"

@interface NetManager : BaseNetworking
+ (id)getBeautyWithPage:(NSInteger)page completionHandler:(void(^)(TRBeautyModel *model, NSError *error))completionHandler;
@end
