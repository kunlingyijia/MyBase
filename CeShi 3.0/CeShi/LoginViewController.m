//
//  LoginViewController.m
//  CeShi
//
//  Created by 席亚坤 on 16/9/12.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "LoginViewController.h"
#import "RequestLogin.h"
#define _KeyDic @"_key":@"e81952aed93e9bac3d46069458cefa0e"
#define XX [[NSUserDefaults standardUserDefaults]objectForKey:@"message"]
@interface LoginViewController ()

@end

@implementation LoginViewController
//NSDictionary *dic = @{_KeyDic,@"user_name":@"13223717545",@"password":@"wodexin00"};
- (void)viewDidLoad {
    [super viewDidLoad];
    RequestLogin *login = [[RequestLogin alloc] init];
    login.name = @"dddd";
    login.passWord = @"dd";
   
    
    

    
    // Do any additional setup after loading the view.
//    823317555771b2ae6c09f41bf12a8c89
//    token = 49e74214a07adddcff8a19ca09c5ffaf;
//    "user_id" = 146424;
    NSDictionary *dic = @{_KeyDic,@"user_name":@"13223717545",@"password":@"wodexin00"};
   // NSDictionary *dic = @{_KeyDic,@"user_name":@"18911997439",@"password":@"abcd1234"};
//    [NetManager getRequestwithURL:@"http://app.yaojinshu.cn/home-adv" withparameters:dic withSuccessResult:^(id successResult) {
//        NSLog(@"%@",successResult);
//    } withErrorResult:^(NSError *errorResult) {
//        
//    }];
//       [NetManager getRequestwithURL:@"http://app.yaojinshu.cn/goods/list" withparameters:dic withSuccessResult:^(id successResult) {
//        NSLog(@"%@",successResult);
//    } withErrorResult:^(NSError *errorResult) {
//        NSLog(@"%@",errorResult);
//    }];

    [NetManager postRequestwithURL:@"http://app.yaojinshu.cn/user/login" parameters:dic withSuccessResult:^(id successResult) {
       // NSLog(@"信息%@",successResult[@"data"]);
         NSString *token =successResult[@"data"][@"token"];
       // NSLog(@"%@",token);
        NSString *user_id =successResult[@"data"][@"user_id"];
        //NSLog(@"%@",user_id);
         NSDictionary *dic1 = @{_KeyDic,@"token":token,@"user_id":user_id,@"page":@"1"};
       
      
//        [NetManager postRequestwithURL:@"http://192.168.1.108/yanjinshu/index.php/Home/LuckyMoney" parameters:dic1 withSuccessResult:^(id successResult) {
//        //NSLog(@"%@",successResult[@"message"]);
//        NSLog(@"好吧%@",successResult);
//        } withErrorResult:^(NSError *errorResult) {
//            NSLog(@"%@",errorResult);
//        }];
        
               [NetManager getRequestwithURL:@"http://app.yaojinshu.cn/user-child/list" withparameters:dic1 withSuccessResult:^(id successResult) {
                  // NSArray *cadic = successResult[@"data"][@"list"];
               // NSLog(@"%@",cadic[1][@"rank_name"]);
                   NSLog(@"%@",successResult);
            } withErrorResult:^(NSError *errorResult) {
                NSLog(@"%@",errorResult);
            }];
        
    } withErrorResult:^(NSError *errorResult) {
        NSLog(@"%@",errorResult);
    }];
   // NSLog(@"想嘻嘻嘻嘻嘻嘻嘻嘻嘻%@",XX);
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
