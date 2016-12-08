//
//  TRCollectionViewCell.m
//  TRProject
//
//  Created by tarena on 2016/12/5.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRCollectionViewCell.h"

@implementation TRCollectionViewCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
    }
    return _iconIV;
}
@end













