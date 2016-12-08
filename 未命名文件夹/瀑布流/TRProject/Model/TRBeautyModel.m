//
//  TRBeautyModel.m
//  TRProject
//
//  Created by tarena on 2016/12/5.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRBeautyModel.h"

@implementation TRBeautyModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data": @"TRBeautyDataModel"};
}
@end

@implementation TRBeautyDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"desc": @"description"};
}
@end














