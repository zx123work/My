//
//  TRBeautyViewModel.m
//  TRProject
//
//  Created by tarena on 2016/12/5.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRBeautyViewModel.h"

@implementation TRBeautyViewModel
- (NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

- (void)getDataWithRequestMode:(RequestMode)mode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    if (mode == RequestModeMore) {
        tmpPage = _page + 1;
    }
    [NetManager getBeautyWithPage:tmpPage completionHandler:^(TRBeautyModel *model, NSError *error) {
        if (mode == RequestModeRefresh) {
            [self.dataList removeAllObjects];
        }
        [self.dataList addObjectsFromArray:model.data];
        _page = tmpPage;
        !completionHandler ?: completionHandler(error);
    }];
}

- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    TRBeautyDataModel *data = self.dataList[row];
    return data.coverUrl.yx_URL;
}

- (CGFloat)heightVSwidthForRow:(NSInteger)row{
    TRBeautyDataModel *data = self.dataList[row];
    return data.coverHeight.doubleValue / data.coverWidth.doubleValue;
}
@end










