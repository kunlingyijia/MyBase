//
//  ErWeiMa.h
//  原生二维码
//
//  Created by 席亚坤 on 16/9/10.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
typedef void(^ReturnStr) (NSString* str);
@interface ErWeiMa : NSObject<AVCaptureMetadataOutputObjectsDelegate>
+(ErWeiMa*)shareErWeiMa;
///扫描容器
//@property (nonatomic, strong) UIView *viewPreview ;

///block
@property (nonatomic, copy) ReturnStr  returnStr ;
///二维码ImageView
@property (nonatomic, strong)UIImageView  *imgView ;

-(void)erweima:(UIImageView *)imageview string:(NSString *)str;

-(void)erweiMaAddview:(UIView*)view returnStr:(ReturnStr)returnstr;


@end
