//
//  Model.h
//  CeShi
//
//  Created by 席亚坤 on 16/10/22.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "videoTopicModel.h"
@interface Model : NSObject
///

@property  NSString *cover ;

@property  NSString *description ;

@property  NSString *length ;

@property  NSString *m3u8Hd_url ;
@property NSString *topicDesc;
@property  NSString *m3u8_url ;

@property  NSString *mp4Hd_url ;

@property NSString *title;
@property NSString * ptime;
//@property NSDictionary * videoTopic;
@property videoTopicModel * videoTopic;
@end
