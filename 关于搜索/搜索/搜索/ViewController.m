//
//  ViewController.m
//  搜索
//
//  Created by 席亚坤 on 16/12/23.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "SearchHistoryView.h"
#import "SearchHistoryViewController.h"
@interface ViewController (){
   
}
@property(nonatomic,strong) SearchHistoryView * SHView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.SHView = (SearchHistoryView*)[self instanceFromNib:@"SearchHistoryView"];
    _SHView.CancelConstrainWidth.constant = 34;
    _SHView.BackConstrainWidth.constant = 34;
    _SHView.frame= CGRectMake(0, 0, self.view.frame.size.width, 64);
    __weak typeof(self) weakSelf = self;
    [_SHView CancelAction:^(NSString *SearchStr) {
      
        

    }];
    [_SHView searchAction:^(NSString *SearchStr) {
        //Push 跳转

        
    }];
    [_SHView backAction:^() {


    }];
    [_SHView SearchTFReturn:^(NSString *SearchStr) {
        NSLog(@"%@",SearchStr);
        //Push 跳转
        SearchHistoryViewController * VC = [[SearchHistoryViewController alloc]initWithNibName:@"SearchHistoryViewController" bundle:nil];
        [weakSelf.navigationController  pushViewController:VC animated:NO];

    }];
    [self.view addSubview:_SHView];
}
-(id)instanceFromNib:(NSString*)nibName{
        NSArray* objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
        return  [objects objectAtIndex:0];
    }


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
