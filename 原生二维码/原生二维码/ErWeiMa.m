//
//  ErWeiMa.m
//  原生二维码
//
//  Created by 席亚坤 on 16/9/10.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ErWeiMa.h"
typedef void (^MyBlock)(NSString *str);
@implementation ErWeiMa{
    UIView *boxView;
    BOOL isReading;
    CALayer *scanLayer;
    AVCaptureSession *captureSession;
    AVCaptureVideoPreviewLayer *videoPreviewLayer;
}

+(ErWeiMa *)shareErWeiMa{
    static ErWeiMa *erWeiMa = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        erWeiMa = [[ErWeiMa alloc]init];
        
    });
    return erWeiMa;
}

-(void)erweima:(UIImageView *)imageview string:(NSString *)str{
    self.imgView.image = nil;
    //二维码滤镜
    self.imgView = imageview;
    
    CIFilter *filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //恢复滤镜的默认属性
    
    [filter setDefaults];
    
    //将字符串转换成NSData
    
    NSData *data=[str dataUsingEncoding:NSUTF8StringEncoding];
    
    //通过KVO设置滤镜inputmessage数据
    
    [filter setValue:data forKey:@"inputMessage"];
    
    //获得滤镜输出的图像
    
    CIImage *outputImage=[filter outputImage];
    
    //将CIImage转换成UIImage,并放大显示
    
    _imgView.image=[self createNonInterpolatedUIImageFormCIImage:outputImage withSize:100.0];
    
    
    
    //如果还想加上阴影，就在ImageView的Layer上使用下面代码添加阴影
    
    _imgView.layer.shadowOffset=CGSizeMake(0, 0.5);//设置阴影的偏移量
    
    _imgView.layer.shadowRadius=1;//设置阴影的半径
    
    _imgView.layer.shadowColor=[UIColor blackColor].CGColor;//设置阴影的颜色为黑色
    
    _imgView.layer.shadowOpacity=0.3;
    

}

//改变二维码大小

- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    
    CGRect extent = CGRectIntegral(image.extent);
    
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 创建bitmap;
    
    size_t width = CGRectGetWidth(extent) * scale;
    
    size_t height = CGRectGetHeight(extent) * scale;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    
    CGContextScaleCTM(bitmapRef, scale, scale);
    
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 保存bitmap到图片
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    
    CGContextRelease(bitmapRef);
    
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
    
}
-(void)erweiMaAddview:(UIView*)view returnStr:(ReturnStr)returnstr{
    __weak ErWeiMa *er = self;
     [er My:view Block:^(NSString *str) {
        returnstr(str);
    }];
  }
-(void)My:(UIView*)view Block:(MyBlock)block{
    //截图 再读取
    UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].bounds.size, YES, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:image.CGImage options:nil];
    CIContext *ciContext = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @(YES)}]; // 软件渲染
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:ciContext options:@{CIDetectorAccuracy : CIDetectorAccuracyHigh}];// 二维码识别
    NSArray *features = [detector featuresInImage:ciImage];
    
    NSString * str1;
    for (CIQRCodeFeature *feature in features) {
        //NSLog(@"msg = %@",feature.messageString); // 打印二维码中的信息
        str1 = feature.messageString;
        
    }
    block(str1);

}
@end
