//
//  TRBeautyViewModel.h
//  TRProject
//
//  Created by tarena on 2016/12/5.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"
/*
 ViewModel层中 应该是 所有Control 中跟 model有关系的操作 都放在这里.
 所以这个类在整个设置模式中的位置是
 Model -> NetManager -> ViewModel -> View -> ViewController
 额外说一点: 原来的ViewModel中是包含NetManager, 这里被独立出来了.
 
 上一层级 可以 知道下一层级. 反之不可以.
 所以 在ViewModel层中 不应该出现 UI开头的内容
 */

typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh,
    RequestModeMore,
};

@interface TRBeautyViewModel : NSObject
/******为View提供的支持方法和属性********/
@property (nonatomic) NSInteger rowNumber;
- (NSURL *)iconURLForRow:(NSInteger)row;
//高/宽
- (CGFloat)heightVSwidthForRow:(NSInteger)row;

/*******与Model层有关的方法和属性********/
@property (nonatomic) NSMutableArray *dataList;
@property (nonatomic) NSInteger page;
- (void)getDataWithRequestMode:(RequestMode)mode completionHandler:(void(^)(NSError *error))completionHandler;
@end













