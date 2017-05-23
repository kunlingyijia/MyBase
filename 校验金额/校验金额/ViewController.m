//
//  ViewController.m
//  校验金额
//
//  Created by 席亚坤 on 17/2/1.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *Tf;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSFileManager *manager=[NSFileManager defaultManager];
    //文件路径
    NSString *filepath = [[NSBundle mainBundle]pathForResource:@"Info" ofType:@"plist"];
    NSLog(@"%@",filepath);
//    if ([manager removeItemAtPath:filepath error:nil]) {
//        NSLog(@"文件删除成功");
//    }

    //获取所有信息字典
    NSMutableDictionary *infoDictionary = (NSMutableDictionary*)[[NSBundle mainBundle] infoDictionary];
    
        //NSLog(@"%@",infoDictionary);
        //CFShow((__bridge CFTypeRef)(infoDictionary));
    
    NSString *executableFile = [infoDictionary objectForKey:(NSString *)kCFBundleExecutableKey]; //获取项目名称
    
    NSLog(@"executableFile == %@",executableFile);
    [infoDictionary setValue:@"哎呀我去" forKey:(NSString *)kCFBundleExecutableKey];
    NSString *executableFile1 = [infoDictionary objectForKey:(NSString *)kCFBundleExecutableKey]; //获取项目名称
    
    NSLog(@"executableFile1 == %@",executableFile1);
    //    NSString *version = [infoDictionary objectForKey:(NSString *)kCFBundleVersionKey]; //获取项目版本号
//    NSLog(@"version .. %@",version);
//    
//    // app名称
//    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
//    NSLog(@"app_Name == %@",app_Name);
//    
//    // app版本
//    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    NSLog(@"app_Version .. %@",app_Version);
//    // app build版本
//    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
//    NSLog(@"app_build >> %@",app_build);
//
  }
//判断输入钱的正则表达式，可输入正负，小数点前5位，小数点后2位，位数可控
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *toString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (toString.length > 0) {
        NSString *stringRegex = @"(\\+|\\-)?(([0]|(0[.]\\d{0,2}))|([1-9]\\d{0,4}(([.]\\d{0,2})?)))?";
        NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
        BOOL flag = [phoneTest evaluateWithObject:toString];
        if (!flag) {
            return NO;
        }
    }
    
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"-----");
}// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called





-(BOOL)validateMoney:(NSString *)money
{
    NSString *phoneRegex = @"^[0-9]+(\\.[0-9]{1,2})?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:money];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
