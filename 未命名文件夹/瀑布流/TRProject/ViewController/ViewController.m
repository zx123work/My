//
//  ViewController.m
//  TRProject
//
//  Created by yingxin on 16/7/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ViewController.h"
#import "NetManager.h"
#import "TRCollectionViewCell.h"
#import "TRBeautyViewModel.h"

@interface ViewController ()<CHTCollectionViewDelegateWaterfallLayout>
//@property (nonatomic) NSMutableArray *dataList;
//@property (nonatomic) NSInteger page;

@property (nonatomic) TRBeautyViewModel *beautyVM;

@end
@implementation ViewController
- (TRBeautyViewModel *)beautyVM{
    if (!_beautyVM) {
        _beautyVM = [TRBeautyViewModel new];
    }
    return _beautyVM;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (long)(([UIScreen mainScreen].bounds.size.width - 10 * 3) / 2);
    //在vm层中,提供一个方法, 能够返回某行的图片的宽高比例
    //TRBeautyDataModel *data = self.dataList[indexPath.row];
    CGFloat height = width * [self.beautyVM heightVSwidthForRow:indexPath.row];
    return CGSizeMake(width, height);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}




- (void)viewDidLoad{
    [super viewDidLoad];
    [self.collectionView registerClass:[TRCollectionViewCell class] forCellWithReuseIdentifier:@"TRCollectionViewCell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.beautyVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.mj_header endRefreshing];
        }];
        /*
         [NetManager getBeautyWithPage:1 completionHandler:^(TRBeautyModel *model, NSError *error) {
         [self.collectionView.mj_header endRefreshing];
         if (!error) {
         [self.dataList removeAllObjects];
         [self.dataList addObjectsFromArray:model.data];
         [self.collectionView reloadData];
         _page = 1;
         }
         }];*/
    }];
    [self.collectionView.mj_header beginRefreshing];
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.beautyVM getDataWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.mj_footer endRefreshing];
        }];
        /*
         [NetManager getBeautyWithPage:_page + 1 completionHandler:^(TRBeautyModel *model, NSError *error) {
         [self.collectionView.mj_footer endRefreshing];
         if (!error) {
         [self.dataList addObjectsFromArray:model.data];
         [self.collectionView reloadData];
         _page += 1;
         }
         }];*/
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //     return self.dataList.count;
    return self.beautyVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TRCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TRCollectionViewCell" forIndexPath:indexPath];
    //TRBeautyDataModel *data = self.dataList[indexPath.row];
    //[cell.iconIV setImageURL:data.coverUrl.yx_URL];
    [cell.iconIV setImageURL:[self.beautyVM iconURLForRow:indexPath.row]];
    //cell.frame = CGRectMake(原x, 上个视图的下底+10, 原w, 原h)
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSMutableArray *)dataList {
//    if(_dataList == nil) {
//        _dataList = [[NSMutableArray alloc] init];
//    }
//    return _dataList;
//}

@end
