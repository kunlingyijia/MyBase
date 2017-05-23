//
//  NetManager.m
//  NetWorking
//
//  Created by lanouhn on 15/12/11.
//  Copyright (c) 2015年 WeiYi. All rights reserved.
//

#import "NetManager.h"
#import "AFHTTPSessionManager.h"
@implementation NetManager


//创建单例

+(id)shareInstance{
    static NetManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetManager alloc]init];
    });
    return manager;
}
+(void)getRequestwithURL:(NSString *)requestURL  withparameters:(NSDictionary *)parameter withSuccessResult:(SuccessResult)successResult withErrorResult:(ErrorResult)errorResult {
    //get

    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setSecurityPolicy:securityPolicy];
   
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html",@"application/x-www-form-urlencoded", nil];
    manager.requestSerializer.timeoutInterval = 30.f;
    //参数1:URL
    //参数2:参数(get一般为nil)
    //参数3:请求成功后的block
    //参数4:请求失败后的block

        [manager GET:requestURL parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
    
    
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //通过block回调到Controller中
            successResult(responseObject);
    
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //通过block回调
            errorResult(error);
        }];

}




//post 请求
+(void)postRequestwithURL:(NSString *)requestURL parameters:(NSDictionary*)parameter withSuccessResult:(SuccessResult) successResult withErrorResult:(ErrorResult) errorResult{
    //post的请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/javascript",  nil];
    //参数 2  为参数 一般为字典
    [manager POST:requestURL parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //Block 回调
        successResult (responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //block 回调
        errorResult (error);

    }];
    
    

    
    
    
    
    
}
///网络检测
+(void)NetWorksSate{
    __weak typeof (self) weakSelf = self;
[[AFNetworkReachabilityManager sharedManager] startMonitoring];
[[AFNetworkReachabilityManager sharedManager ] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
    switch (status) {
        case -1:
            NSLog(@"未知网络");
            break;
        case 0:
            NSLog(@"网络不可达");
            break;
        case 1:
            NSLog(@"GPRS网络");
            break;
        case 2:
            NSLog(@"wifi网络");
            break;
        default:
            break;
    }
    if(status ==AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi)
    {
        NSLog(@"有网");
    }else
    {
        NSLog(@"没有网");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"网络失去连接" message:nil delegate:weakSelf cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alert show];
    }
}];

}


@end
