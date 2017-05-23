//
//  ViewController.m
//  城市三级联动
//
//  Created by 席亚坤 on 16/11/20.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "RegionViewController.h"
@interface ViewController ()
//省id
@property (weak, nonatomic) IBOutlet UILabel *provinceLabel;
//市id
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
//县区id
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//选择按钮
- (IBAction)chooseBtnAction:(UIButton *)sender {
    //Push 跳转
    RegionViewController * VC = [[RegionViewController alloc]initWithNibName:@"RegionViewController" bundle:nil];
    VC.view.backgroundColor = [UIColor grayColor];
    [VC ReqionReturn:^(NSDictionary *reqionDic) {
        [sender setTitle:reqionDic[@"name"] forState:(UIControlStateNormal)];
        self.provinceLabel.text = reqionDic[@"province_id"];
        self.cityLabel.text = reqionDic[@"city_id"];
        self.regionLabel.text = reqionDic[@"region_id"];
        
    }];

    [self presentViewController:VC animated:YES completion:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
