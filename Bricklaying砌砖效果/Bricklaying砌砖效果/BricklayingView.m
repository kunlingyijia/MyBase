//
//  BricklayingView.m
//  Bricklaying砌砖效果
//
//  Created by 席亚坤 on 16/12/28.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "BricklayingView.h"
#import "BricklayingCell.h"
@interface BricklayingView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView    *_collectionView;   //流布局视图
    NSMutableArray      *_dataArr;          //流布局数据源
    NSMutableArray * _indexArr;
}

@end

@implementation BricklayingView


/**
 *  初始化方法
 *
 *  @param frame 流布局frame
 *  @param items 外部导入的数据源
 *  @param click item点击响应回调block
 *
 *  @return 自定义流布局对象
 */
-(id)initWithFrame:(CGRect)frame andItems:(NSArray *)items andItemClickBlock:(itemClickBlock)click{
    
    if (self == [super initWithFrame:frame]) {
        _dataArr                    = [NSMutableArray arrayWithArray:items];
        _itemClick                  = click;
        self.userInteractionEnabled = YES;
        //初始化数据源
        
         _indexArr = [NSMutableArray arrayWithObject:@[[UIColor redColor],[UIColor whiteColor]]];
        for (int i = 0; i<_dataArr.count-1; i++) {
            [_indexArr addObject:@[[UIColor whiteColor],[UIColor blackColor]]];
        }
        [self configBaseView];
    }
    return self;
}


/**
 *  搭建基本视图
 */
- (void)configBaseView{
    self.backgroundColor            = [UIColor whiteColor];
    /* 自定义布局格式 */
    JHCustomFlow *flow              = [[JHCustomFlow alloc] init];
    flow.minimumLineSpacing         = 10;
    flow.minimumInteritemSpacing    = 10;
    /* 初始化流布局视图 */
    _collectionView                 = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
    _collectionView.dataSource      = self;
    _collectionView.delegate        = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_collectionView];
    /* 提前注册流布局item */
    
    [_collectionView registerNib:[UINib nibWithNibName:@"BricklayingCell" bundle:nil] forCellWithReuseIdentifier:@"BricklayingCell"];
    
}


#pragma mark -------------> UICollectionView协议方法
/**
 *  自定义流布局item个数 要比数据源的个数 需要一个作为清除历史记录的行
 *
 *  @param collectionView 当前流布局视图
 *  @param section        nil
 *
 *  @return 自定义流布局item的个数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArr.count ;
}


/**
 *  第index项的item的size大小
 *
 *  @param collectionView       当前流布局视图
 *  @param collectionViewLayout nil
 *  @param indexPath            item索引
 *
 *  @return size大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
    NSString *str = _dataArr[indexPath.row];
    /* 根据每一项的字符串确定每一项的size */
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGSize size        = [str boundingRectWithSize:CGSizeMake(self.frame.size.width, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size;
    size.height        = 30;
    size.width         += 10;
    return size;
    
}

/**
 *  流布局的边界距离 上下左右
 *
 *
 *
 *  @return 边界距离值
 */
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(20, 20, 20, 20);
//}


/**
 *  第index项的item视图
 *
 *  @param collectionView 当前流布局
 *  @param indexPath      索引
 *
 *  @return               item视图
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BricklayingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BricklayingCell" forIndexPath:indexPath];
    NSString *str                       = _dataArr[indexPath.row];
    NSArray * ColorArr = _indexArr[indexPath.row];
    cell.BricklayingLabel.text  = str;
    cell.contentView.backgroundColor = ColorArr.firstObject;
    cell.BricklayingLabel.textColor = ColorArr.lastObject;
       return cell;
}



/**
 *  当前点击的item的响应方法
 *
 *  @param collectionView 当前流布局
 *  @param indexPath      索引
 */
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [_indexArr removeAllObjects];
    for (int i = 0; i<_dataArr.count; i++) {
        [_indexArr addObject:@[[UIColor whiteColor],[UIColor blackColor]]];
    }
    [_indexArr replaceObjectAtIndex:indexPath.row withObject:@[[UIColor redColor],[UIColor whiteColor]]];
    [_collectionView reloadData];
    
    /* 响应回调block */
    _itemClick(indexPath.row);
}

@end




@implementation JHCustomFlow


/**
 *  重写当前方法 实现控制item最大间距
 *
 *  @param rect 绘图范围
 *
 *  @return item属性数组
 */
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for(int i = 0; i < [attributes count]; i++) {
        
        if (i==0) {
            UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
            CGRect frame                                              = currentLayoutAttributes.frame;
            frame.origin.x                                            = 10;
            currentLayoutAttributes.frame                             = frame;
            
            continue;
        }
        
        //当前attributes
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
        //上一个attributes
        UICollectionViewLayoutAttributes *prevLayoutAttributes    = attributes[i - 1];
        //我们想设置的最大间距，可根据需要改
        NSInteger maximumSpacing                                  = 10;
        
        //前一个cell的最右边
        NSInteger origin                                          = CGRectGetMaxX(prevLayoutAttributes.frame);
        //如果当前一个cell的最右边加上我们想要的间距加上当前cell的宽度依然在contentSize中，我们改变当前cell的原点位置
        //不加这个判断的后果是，UICollectionView只显示一行，原因是下面所有cell的x值都被加到第一行最后一个元素的后面了
        if(origin + maximumSpacing  + currentLayoutAttributes.frame.size.width < self.collectionViewContentSize.width) {
            CGRect frame                  = currentLayoutAttributes.frame;
            frame.origin.x                = origin + maximumSpacing;
            currentLayoutAttributes.frame = frame;
        }else{
            CGRect frame                  = currentLayoutAttributes.frame;
            frame.origin.x                = 10;
            currentLayoutAttributes.frame = frame;
        }
    }
    return attributes;
}
@end



