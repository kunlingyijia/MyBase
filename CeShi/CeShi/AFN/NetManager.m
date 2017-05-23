//
//  NetManager.m
//  NetWorking
//
//  Created by lanouhn on 15/12/11.
//  Copyright (c) 2015年 WeiYi. All rights reserved.
//

#import "NetManager.h"
#import "AFHTTPRequestOperationManager.h"
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
+(void)getRequestwithURL:(NSString *)requestURL   withSuccessResult:(SuccessResult)successResult withErrorResult:(ErrorResult) errorResult{
    //利用AFN进行get请求
    
    //1.创建一个Manager单例
    AFHTTPRequestOperationManager  *manager = [AFHTTPRequestOperationManager manager];
    //2.
    //(1) 设置支持返回格式
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
   // manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //(2)把返回格式设置为二进制
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //(2)把返回格式设置为JSON格式(一般不用写,默认的是JSON格式)
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //参数1:URL
    //参数2:参数(get一般为nil)
    //参数3:请求成功后的block
    //参数4:请求失败后的block
    [manager GET:requestURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //通过block回调到Controller中
        successResult(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //通过block回调
        errorResult(error);
    }];
}




//post 请求
+(void)postRequestwithURL:(NSString *)requestURL parameters:(NSDictionary*)parameter withSuccessResult:(SuccessResult) successResult withErrorResult:(ErrorResult) errorResult{
    
    //post的请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    //参数 2  为参数 一般为字典
    
    [manager POST:requestURL    parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
      
        //Block 回调
        successResult (responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       // NSLog(@"%@",error);
        //block 回调
        errorResult (error);
        
    }];
    

    
    
    
    
    
}







@end
