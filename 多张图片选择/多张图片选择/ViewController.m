//
//  ViewController.m
//  多张图片选择
//
//  Created by 席亚坤 on 17/3/24.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#define SCREEN_WIDTH                        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT                       [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "TZTestCell.h"
#import "LxGridViewFlowLayout.h"
#import "TZImagePickerController.h"
#import "SDWebImageManager.h"
@interface ViewController () <UICollectionViewDataSource, UIActionSheetDelegate, TZImagePickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeight;
/** 图片数组 */
@property (nonatomic, strong) NSMutableArray *imageArray;
/** asset 数组，用以确定已选中的图片 */
@property (nonatomic, strong) NSMutableArray *assetArray;
@end

@implementation ViewController
#pragma mark - lazy init

- (NSMutableArray *)assetArray {
    if (!_assetArray) {
        _assetArray = [[NSMutableArray alloc] init];
    }
    return _assetArray;
}

- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    SDWebImageManager *mgr = [SDWebImageManager sharedManager];
//    [mgr downloadImageWithURL:[NSURL URLWithString:imageStr] options:SDWebImageCacheMemoryOnly progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//        if (image && !error) {
//            [self.imageArray addObject:image];
//            [self.imageCollectionView reloadData];
//            [self setupCollectionViewHeight];
//        }
//    }];
    
    
    [self setupCollectionView];

}
/**
 设置 collectionView 的各属性
 */
- (void)setupCollectionView {
    LxGridViewFlowLayout *layout = [[LxGridViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    CGFloat WH = (SCREEN_WIDTH - 50) / 4.f;
    layout.itemSize = CGSizeMake(WH, WH);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.imageCollectionView registerClass:[TZTestCell class] forCellWithReuseIdentifier:@"image_collectionviewcell"];
    self.imageCollectionView.collectionViewLayout = layout;
    [self setupCollectionViewHeight];
}
#pragma mark - others

/**
 push 图片选择控制器
 */
- (void)pushImagePickerViewController {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    imagePickerVc.selectedAssets = self.assetArray;
    imagePickerVc.isSelectOriginalPhoto = YES;
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}



#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"image_collectionviewcell" forIndexPath:indexPath];
    if (indexPath.row == self.imageArray.count) {
        cell.imageView.image = [UIImage imageNamed:@"goods_add_plus"];
        cell.deleteBtn.hidden = YES;
    } else {
        cell.imageView.image = self.imageArray[indexPath.row];
        cell.deleteBtn.hidden = NO;
        
    }
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.imageArray.count) {
        [self pushImagePickerViewController];
    }
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    self.imageArray = [NSMutableArray arrayWithArray:photos];
    self.assetArray = [NSMutableArray arrayWithArray:assets];
    [self.imageCollectionView reloadData];
    [self setupCollectionViewHeight];
}


#pragma mark - LxGridViewDataSource

/// 以下三个方法为长按排序相关代码
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.item < self.imageArray.count;
}

- (BOOL)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath canMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    return (sourceIndexPath.item < self.imageArray.count && destinationIndexPath.item < self.imageArray.count);
}

- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath didMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    UIImage *image = self.imageArray[sourceIndexPath.item];
    PHAsset *asset = self.assetArray[sourceIndexPath.item];
    [self.imageArray removeObjectAtIndex:sourceIndexPath.item];
    [self.imageArray insertObject:image atIndex:destinationIndexPath.item];
    [self.assetArray removeObjectAtIndex:sourceIndexPath.item];
    [self.assetArray insertObject:asset atIndex:destinationIndexPath.item];
    [self.imageCollectionView reloadData];
}



/**
 更新 collectionView 高度
 */
- (void)setupCollectionViewHeight {
    NSInteger row = ceil((self.imageArray.count + 1) / 4.0);
    
    self.collectionViewHeight.constant = (SCREEN_WIDTH - 20) / 4.0 * row + 20;
    //NSLog(@"%f",self.collectionViewHeight.constant);
    NSLog(@"---%f",self.bottomHeight.constant);
    self.bottomHeight.constant =  (SCREEN_WIDTH - 20) / 4.0 * row;
    NSLog(@"++++%f",self.bottomHeight.constant);
 
}
/**
 collectionView 图片删除按钮点击事件处理
 
 @param btn 删除按钮
 */
- (void)deleteBtnClik:(UIButton *)btn {
    NSInteger index = btn.tag;
    [self.imageArray removeObjectAtIndex:index];
    // 编辑时无 asset 对象
    if (self.assetArray.count) {
        [self.assetArray removeObjectAtIndex:index];
    }
    
    [self.imageCollectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        [self.imageCollectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [self.imageCollectionView reloadData];
        [self setupCollectionViewHeight];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
