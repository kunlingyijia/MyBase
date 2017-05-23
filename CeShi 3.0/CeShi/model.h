//
//  model.h
//  CeShi
//
//  Created by 席亚坤 on 16/9/11.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model : NSObject
///发布时间
@property (nonatomic, strong) NSString *add_time ;
///新闻标题
@property (nonatomic, strong) NSString *title ;

///新闻简介
@property (nonatomic, strong) NSString*descriptionNew;
///新闻内容
@property (nonatomic, strong) NSString *content ;
///图片地址
@property (nonatomic, strong) NSString *file_url ;
///新闻ID
@property (nonatomic, strong) NSString *article_id ;

///商品ID
@property (nonatomic, strong) NSString *goods_id ;

///商品图片
@property (nonatomic, strong) NSString *goods_thumb ;
///商品名称
@property (nonatomic, strong) NSString *goods_name ;
///商品价格
@property (nonatomic, strong) NSString *market_price ;




















@end
