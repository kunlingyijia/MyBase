//
//  IMenuTabTwoCell.m
//  夺宝分类
//
//  Created by 席亚坤 on 17/4/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//
#define IMenuWidth [UIScreen mainScreen].bounds.size.width
#import "IMenuTabTwoCell.h"
@interface IMenuTabTwoCell ()
///数据
@property (nonatomic,strong)NSMutableArray * dataArray;
//@property(nonatomic,strong)NSString *IsOpen;
@end
@implementation IMenuTabTwoCell
- (void)awakeFromNib {
    [super awakeFromNib];
    for (int i=2; i<5; i++) {
        UIButton *btn = [self viewWithTag:100+i];
        [btn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        
    }
    //Cell背景颜色
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];

    //cell选中时的颜色 无色
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //Cell右侧箭头
    //self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    self.separatorInset = UIEdgeInsetsMake(0, IMenuWidth, 0, 0); // ViewWidth  [宏] 指的是手机屏幕的宽度
//     [self addSubViews];
    }

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }return _dataArray;
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        __weak typeof(self) weakSelf = self;

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
              [weakSelf addSubViews];
        });

      
    }
    return self;
}


-(void)addSubViews{
   // self.count = 0;
    if (!_collectionView) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //配置布局对象的属性
        //设置cell的大小 ------ item
        flowLayout.itemSize = CGSizeMake((IMenuWidth-25)/4, IMenuWidth*0.1);
        // CGFloat xx = ([UIScreen mainScreen].bounds.size.width-240)/5;
        //NSLog(@"%f",xx);
        //设置分区的边界
        flowLayout.sectionInset = UIEdgeInsetsMake(5 , 5, 5, 5);
        //设置行间距
        flowLayout.minimumLineSpacing = 2.5;
        //设置两个item之间的距离
        flowLayout.minimumInteritemSpacing =5;
        //设置滚动的方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.width/2) collectionViewLayout:flowLayout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        //_collectionView.pagingEnabled = YES;
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        //注册

        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionReusableView"];
        [self.collectionView registerNib:[UINib nibWithNibName:@"IMenConOneCell" bundle:nil] forCellWithReuseIdentifier:@"IMenConOneCell"];
        [self.contentView addSubview: _collectionView];
    }



}

#pragma mark --集合视图代理方法
//集合视图分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
//集合视图分区内item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}
//item 配置
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionReusableView" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];


    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.IMenuTabTwoCellBlock(indexPath.row);
}



-(void)CellGetData:(NSMutableArray*)Arr{
    self.count = Arr.count;
    self.dataArray = Arr;
   //[self.collectionView reloadData];
}


@end
