//
//  TRBeautyModel.h
//  TRProject
//
//  Created by tarena on 2016/12/5.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRBeautyDataModel;
@interface TRBeautyModel : NSObject

@property (nonatomic, assign) NSInteger pageNum;

@property (nonatomic, strong) NSArray<TRBeautyDataModel *> *data;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalPage;

@property (nonatomic, assign) NSInteger totalRecord;

@end

@interface TRBeautyDataModel : NSObject
//description ->desc
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *coverHeight;

@property (nonatomic, copy) NSString *galleryId;

@property (nonatomic, copy) NSString *updated;

@property (nonatomic, copy) NSString *destUrl;

@property (nonatomic, copy) NSString *coverWidth;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *picsum;

@property (nonatomic, copy) NSString *created;

@property (nonatomic, copy) NSString *coverUrl;

@property (nonatomic, copy) NSString *commentCount;

@property (nonatomic, copy) NSString *clicks;

@property (nonatomic, copy) NSString *modify_time;

@end

