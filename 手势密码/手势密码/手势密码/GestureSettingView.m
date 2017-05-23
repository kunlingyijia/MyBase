//
//  GestureSettingView.m
//  DWduifubao
//
//  Created by 席亚坤 on 16/11/26.
//  Copyright © 2016年 bianming. All rights reserved.
//

#import "GestureSettingView.h"
#import "JXGesturePasswordView.h"
#define greImage @"密码1"
#define redimage @"密码3"
@interface GestureSettingView ()<JXGesturePasswordViewDelegate>
@property(nonatomic,assign)NSInteger interger;
@end

@implementation GestureSettingView
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.interger = 0;
        [self imgV];
        self.backgroundColor = [UIColor colorWithHexString:kViewBackgroundColor];
            self.userInteractionEnabled = YES;
        JXGesturePasswordView *gesturePasswordView = [[JXGesturePasswordView alloc] init];
        gesturePasswordView.center = self.center;
        gesturePasswordView.backgroundColor = [UIColor clearColor ];
        gesturePasswordView.delegate = self;
        [self addSubview:gesturePasswordView];
        [gesturePasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            if (iPhone5s) {
                make.top.equalTo(self).with.offset(170);
                make.size.mas_equalTo(CGSizeMake(250, 250));
            }else {
                make.top.equalTo(self).with.offset(200);
                make.size.mas_equalTo(CGSizeMake(280, 280));
            }
        }];
        
    }
    return self;
}
///返回手势密码
-(void)GestureReturnStr:(Gesture)returnStr{
    self.gesture = returnStr;
}
- (void)gesturePasswordView:(JXGesturePasswordView *)gesturePasswordView didFinishDrawPassword:(NSString *)password{
    if (password.length>3) {
    self.label.textColor = [UIColor blackColor];
    self.interger ++;
    if (_interger%2==0) {
        [self imgV];
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"setPassword"]isEqualToString:password ] ) {
            [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"setPassword"];
            self.label.text = @"恭喜设置成功!!";
            self.gesture(password);
            NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"setPassword"]);
        }else{
            self.label.textColor = [UIColor redColor];
            self.label.text = @"与上次绘制不一致,请重新绘制";
             //NSLog(@"%@",password);
        }
        
    }else{
         [self imgVChangeImage:password];
        [[NSUserDefaults standardUserDefaults]setObject:password forKey:@"setPassword"];
         NSLog(@"%@",password);
        
         self.label.text = @"请再次绘制解锁图案";
        }
        
    }else{
        //密码小于4位
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"setPassword"];
        self.label.textColor = [UIColor redColor];
        self.label.text= @"手势密码至少4位!!";
    }
    
    
}

-(void)imgVChangeImage:(NSString*)password{
    for(int i =0; i < [password length]; i++)
    {
        int  a =[password characterAtIndex:i];
 
        if (a==49) {
            self.oneImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",redimage]];
           // NSLog(@"%d",a);
        }
        if (a==50) {
            self.twoImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",redimage]];
           // NSLog(@"%d",a);
        }
        if (a==51) {
          // NSLog(@"%d",a);
            self.threeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",redimage]];
        }
        if (a==52) {
            self.fourImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",redimage]];
          // NSLog(@"%d",a);
        }
        if (a==53) {
            self.fiveImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",redimage]];
            //NSLog(@"%d",a);
        }
        if (a==54) {
            self.sixImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",redimage]];
            //NSLog(@"%d",a);
        }
        if (a==55) {
            self.sevenimageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",redimage]];
            //NSLog(@"%d",a);
        }
        if (a==56) {
            self.eightimageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",redimage]];
            //NSLog(@"%d",a);
        }
        if (a==57) {
            self.nightimageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",redimage]];
            //NSLog(@"%d",a);
        }

    }
    
    
}

-(void)imgV{
    self.oneImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",greImage]];
    self.twoImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",greImage]];
    self.threeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",greImage]];
    self.fourImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",greImage]];
    self.fiveImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",greImage]];
    self.sixImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",greImage]];
    self.sevenimageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",greImage]];
    self.eightimageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",greImage]];
    self.nightimageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",greImage]];

}
-(void)dealloc{

}


@end
