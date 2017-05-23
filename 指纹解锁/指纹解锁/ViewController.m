//
//  ViewController.m
//  指纹解锁
//
//  Created by 席亚坤 on 16/12/18.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "LocalAuthentication/LAContext.h"
@interface ViewController ()
@property(nonatomic ,strong)NSString *returnCode;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
}

- (IBAction)fingerprintAction:(UIButton *)sender {
    //初始化上下文对象
    LAContext* context = [[LAContext alloc] init];
    //错误对象
    NSError* error = nil;
    NSString* result = @"Authentication需要验证你的指纹";
    
    //首先使用canEvaluatePolicy 判断设备支持状态
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        //支持指纹验证
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:result reply:^(BOOL success, NSError *error) {
            if (success) {
                
                NSLog(@"验证成功");
                
                //验证成功，主线程处理UI
            }
            else
            {
                NSLog(@"%@",error.localizedDescription);
                switch (error.code) {
                    case kLAErrorSystemCancel:
                    {
                        NSLog(@"系统取消了验证touch id");
                        //切换到其他APP，系统取消验证Touch ID
                        break;
                    }
                    case kLAErrorUserCancel:
                    {
                        NSLog(@"用户取消了验证");
                        //用户取消验证Touch ID
                        break;
                    }
                    case kLAErrorUserFallback:
                    {
                        NSLog(@"用户选择手动输入密码");
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            //用户选择其他验证方式，切换主线程处理
                        }];
                        break;
                    }
                    default:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            
                            NSLog(@"其它情况");
                            
                            //其他情况，切换主线程处理
                        }];
                        break;
                    }
                }
            }
        }];
    }
    else
    {
        //不支持指纹识别，LOG出错误详情
        
        switch (error.code) {
            case kLAErrorTouchIDNotEnrolled:
            {
                NSLog(@"设备Touch ID不可用，用户未录入");
                break;
            }
            case kLAErrorPasscodeNotSet:
            {
                NSLog(@"系统未设置密码");
                break;
            }
            default:
            {
                NSLog(@"TouchID 不可用");
                break;
            }
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
