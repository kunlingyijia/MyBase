//
//  ViewController.m
//  改变布局--集合视图
//
//  Created by 席亚坤 on 16/11/21.
//  Copyright © 2016年 席亚坤. All rights reserved.
//
#import "ViewController.h"
#import "collectionOneCell.h"
#import "collectionTwoCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"collectionOneCell" bundle:nil] forCellWithReuseIdentifier:@"collectionOneCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"collectionTwoCell" bundle:nil] forCellWithReuseIdentifier:@"collectionTwoCell"];
     self.collocationCellLayout =oneCellLayout;
}
- (IBAction)ChangeLaout:(UIBarButtonItem *)sender {
          sender.tag++;
        if (sender.tag%2==1) {
           sender.title = @"竖";

           self.collocationCellLayout =twoCellLayout;
           [self.collectionView reloadData];
       }else{
            sender.title = @"横";
         self.collocationCellLayout =oneCellLayout;
           [self.collectionView reloadData];
       }
}

#pragma mark --集合视图代理方法
//集合视图分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
//集合视图分区内item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
//item 配置
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //配置item
    switch (self.collocationCellLayout) {
        case oneCellLayout:{
            
            collectionOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionOneCell" forIndexPath:indexPath];
            return cell;
        }
            break;
        case twoCellLayout:{
            collectionTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionTwoCell" forIndexPath:indexPath];
            return cell;
        }
            break;
        default:
            break;
    }
}

#pragma 集合视图 --约束代理方法
//item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (self.collocationCellLayout) {
        case oneCellLayout:{
            return CGSizeMake(([UIScreen mainScreen].bounds.size.width-9)/2, 300);
        }
            break;
        case twoCellLayout:{
            return CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
        }
            break;
        default:
            break;
    }

       
}
//设置每个cell上下左右相距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    switch (self.collocationCellLayout) {
        case oneCellLayout:{
              return UIEdgeInsetsMake(3, 3, 3, 3);
        }
            break;
        case twoCellLayout:{
              return UIEdgeInsetsMake(0, 0, 0, 0);
        }
            break;
        default:
            break;
    }

}
//设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    switch (self.collocationCellLayout) {
        case oneCellLayout:{
            return 3 ;

        }
            break;
        case twoCellLayout:{
            return 0 ;

        }
            break;
        default:
            break;
    }

    
}
// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    switch (self.collocationCellLayout) {
        case oneCellLayout:{
            return 3;
        }
            break;
        case twoCellLayout:{
            return 0;
        }
            break;
        default:
            break;
    }

}
//灵活的设置每个分区的页眉的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return  CGSizeMake([UIScreen mainScreen].bounds.size.width, 0);
}
//灵活的设置每个分区的页脚的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake( [UIScreen mainScreen].bounds.size.width ,0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
