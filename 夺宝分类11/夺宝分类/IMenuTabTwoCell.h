//
//  IMenuTabTwoCell.h
//  夺宝分类
//
//  Created by 席亚坤 on 17/4/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IMenuTabTwoCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
///HotHomeCellBlock
@property (nonatomic, copy) void(^IMenuTabTwoCellBlock)(NSInteger tag) ;
///
@property (nonatomic, strong) UICollectionView  *collectionView ;

-(void)CellGetData:(NSMutableArray*)Arr;
///
@property (nonatomic, assign) NSInteger count;

@end
