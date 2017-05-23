//
//  UserGuideViewController.m
//  用户引导页
//
//  Created by 席亚坤 on 16/9/13.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "UserGuideViewController.h"

@interface UserGuideViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewThree;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation UserGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    self.imageViewThree.userInteractionEnabled = YES;
    [self.imageViewThree addGestureRecognizer:tap];
    tap.numberOfTapsRequired = 1;

}
//只要拖拽就会触发(scrollView 的偏移量发生改变)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger integer = scrollView.contentOffset.x;
    
    switch (integer) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
            
        case 2:
        {
            
        }
            break;
            

        default:
            break;
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)handleTapGesture:(UITapGestureRecognizer*)sender{
    NSLog(@"点我啊");
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
