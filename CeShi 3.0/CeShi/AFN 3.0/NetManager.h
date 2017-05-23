//
//  NetManager.h
//  NetWorking
//
//  Created by lanouhn on 15/12/11.
//  Copyright (c) 2015年 WeiYi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessResult)(id successResult);
typedef void(^ErrorResult)(NSError *errorResult);

@interface NetManager : NSObject

//创建单例

+(id)shareInstance;


//get请求

+(void)getRequestwithURL:(NSString *)requestURL withparameters:(NSDictionary*)parameter  withSuccessResult:(SuccessResult) successResult withErrorResult:(ErrorResult) errorResult;
//post 请求
+(void)postRequestwithURL:(NSString *)requestURL parameters:(NSDictionary*)parameter withSuccessResult:(SuccessResult) successResult withErrorResult:(ErrorResult) errorResult;


///网络状态

+(void)NetWorksSate;


@end
