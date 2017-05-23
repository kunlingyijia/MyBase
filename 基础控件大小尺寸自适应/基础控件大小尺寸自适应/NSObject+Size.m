//
//  NSObject+Size.m
//  基础控件大小尺寸自适应
//
//  Created by 席亚坤 on 16/12/15.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "NSObject+Size.h"
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)
@implementation NSObject (Size)
+(void)FoutSize10_5:(NSArray*)arr{
    NSSet * set = [NSSet setWithArray:arr];
    for (id Object in set) {
        if ([Object isKindOfClass:[UIButton  class]]) {
            UIButton * btn = (UIButton *)Object;
            btn.titleLabel.font = [UIFont systemFontOfSize:(int)(10.5*SizeScale)];

        }else if ([Object isKindOfClass:[UILabel  class]]){
            UILabel *label = (UILabel *)Object;
            label.font = [UIFont systemFontOfSize:(int)(10.5*SizeScale)];
        }else if ([Object isKindOfClass:[UITextField  class]]){
            UITextField *TF = (UITextField*)Object;
            TF.font = [UIFont systemFontOfSize:(int)(10.5*SizeScale)];
        }else if ([Object isKindOfClass:[UITextView  class]]){
            UITextView *TV = (UITextView*)Object;
            TV.font = [UIFont systemFontOfSize:(int)(10.5*SizeScale)];
        }else {
            
            
        }
        
        
    }
    NSLog(@"%d",(int)(10.5*SizeScale));

}
+(void)FoutSize12:(NSArray*)arr{
    NSSet * set = [NSSet setWithArray:arr];
    for (id Object in set) {
        if ([Object isKindOfClass:[UIButton  class]]) {
            UIButton * btn = (UIButton *)Object;
            btn.titleLabel.font = [UIFont systemFontOfSize:(int)(12*SizeScale)];
            
        }else if ([Object isKindOfClass:[UILabel  class]]){
            UILabel *label = (UILabel *)Object;
            label.font = [UIFont systemFontOfSize:(int)(12*SizeScale)];
        }else if ([Object isKindOfClass:[UITextField  class]]){
            UITextField *TF = (UITextField*)Object;
            TF.font = [UIFont systemFontOfSize:(int)(12*SizeScale)];
        }else if ([Object isKindOfClass:[UITextView  class]]){
            UITextView *TV = (UITextView*)Object;
            TV.font = [UIFont systemFontOfSize:(int)(12*SizeScale)];
        }else {
            
            
        }
        
        
    }
    NSLog(@"%d",(int)(12*SizeScale));

}
+(void)FoutSize14:(NSArray*)arr{
    NSSet * set = [NSSet setWithArray:arr];
    for (id Object in set) {
        if ([Object isKindOfClass:[UIButton  class]]) {
            UIButton * btn = (UIButton *)Object;
            btn.titleLabel.font = [UIFont systemFontOfSize:(int)(14*SizeScale)];
            
        }else if ([Object isKindOfClass:[UILabel  class]]){
            UILabel *label = (UILabel *)Object;
            label.font = [UIFont systemFontOfSize:(int)(14*SizeScale)];
        }else if ([Object isKindOfClass:[UITextField  class]]){
            UITextField *TF = (UITextField*)Object;
            TF.font = [UIFont systemFontOfSize:(int)(14*SizeScale)];
        }else if ([Object isKindOfClass:[UITextView  class]]){
            UITextView *TV = (UITextView*)Object;
            TV.font = [UIFont systemFontOfSize:(int)(14*SizeScale)];
        }else{
            
        }
        
        
    }
    NSLog(@"%d",(int)(14*SizeScale));
}
@end
