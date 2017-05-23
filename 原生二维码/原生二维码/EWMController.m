//
//  EWMController.m
//  原生二维码
//
//  Created by 席亚坤 on 16/9/10.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "EWMController.h"
#import "ErWeiMa.h"
@interface EWMController ()
@property(nonatomic,strong)UIImageView *imgView;
@end

@implementation EWMController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    self.imgView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.width/2.0)];
    
    [self.view addSubview:_imgView];
    
    ErWeiMa *er =[ErWeiMa shareErWeiMa];
    [er erweima:_imgView string:@"dfklnafadsk.f,adad多发的是佛苦辣都发到疯了 都发送到您付款拉风阿拉丁少烦恼的 十多年拉手打斯大林的v阿迪达斯受得了了  "];
    [er erweiMaAddview:self.view returnStr:^(NSString *str) {
        NSLog(@"%@",str);
    }];
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
