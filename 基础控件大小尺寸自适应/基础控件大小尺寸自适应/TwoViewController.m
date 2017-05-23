//
//  TwoViewController.m
//  基础控件大小尺寸自适应
//
//  Created by 席亚坤 on 16/12/14.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "TwoViewController.h"
#import "UIView+Size.h"
#import "NSLayoutConstraint+Size.h"
#import "UILabel+Size.h"
#import "NSObject+Size.h"
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)
@interface TwoViewController ()
@property (weak, nonatomic) IBOutlet UIView *RedView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;

@end

@implementation TwoViewController
- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}
-(void)loadView{
    [super loadView];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  //  self.RedConstraintsHeight.constant = self.RedConstraintsHeight.constant *SizeScale;
    [NSObject FoutSize14:@[_Onelable,_Onelable,_OneBtn,_ThreeLabel,_FourLabel,_TwoLabel,_OneTF]];
    [NSLayoutConstraint NSLayoutConstraint:@[_RedConstraintsHeight,_YellowConstraintHeight,_Onelable,_Onelable,_OneBtn,_ThreeLabel,_FourLabel,_TwoLabel,_OneTF]];
   
    
//    [NSLayoutConstraint NSLayoutConstraint:@[self.RedConstraintsHeight,self.imageViewConstraintHeight,self.YellowConstraintHeight]  ];
//    [UILabel LabelSize10_5:@[self.Onelable,self.Onelable,self.Onelable,self.Onelable]];
//    [UILabel LabelSize12:@[self.TwoLabel]];
//    [UILabel LabelSize14:@[self.ThreeLabel,self.FourLabel]];
//     self.ThreeLabel.font = [UIFont systemFontOfSize:17*SizeScale];
//     self.FourLabel.font = [UIFont systemFontOfSize:17*SizeScale];
    //736
   // NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
    for (UIView* subView in self.view.subviews) {
        NSLog(@"%@",subView);;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
  
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.RedView viewSize];
//    NSLog(@"%f",self.RedView.frame.size.height);
//    [self.yellowView viewSize];
  
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
