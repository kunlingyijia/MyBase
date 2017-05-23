//
//  UIView+FontSize.m
//  FontSizeModify
//
//  Created by dyw on 16/10/22.
//  Copyright © 2016年 dyw. All rights reserved.
//

#import "UIView+FontSize.h"
#import "DWlabel.h"
#import "DWButtion.h"
#import "DWTextfield.h"
#import "DWTextView.h"
#import "DWImageView.h"
#import <objc/runtime.h>

#define IgnoreTagKey @"IgnoreTagKey"
#define FontScaleKey @"FontScaleKey"

#define ScrenScale ([UIScreen mainScreen].bounds.size.height/568.0)
#define W ([UIScreen mainScreen].bounds.size.width/320.0)

@implementation UIView (FontSize)
/**
 设置需要忽略的空间tag值
 
 @param tagArr tag值数组
 */
+ (void)setIgnoreTags:(NSArray<NSNumber*> *)tagArr{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:tagArr forKey:IgnoreTagKey];
    [defaults synchronize];
}

/**
 设置字体大小比例
 
 @param value 需要设置的比例
 */
+ (void)setFontScale:(CGFloat)value{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@(value) forKey:FontScaleKey];
    [defaults synchronize];
}

+ (NSArray *)getIgnoreTags{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *ignoreTagsArr = [defaults objectForKey:IgnoreTagKey];
    return ignoreTagsArr.count?ignoreTagsArr:0;
}

+ (CGFloat)getFontScale{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *valueNum = [defaults objectForKey:FontScaleKey];
    return valueNum?valueNum.floatValue:0;
}

@end
/*------ 有关Label---------*/
@interface UILabel (FontSize)

@end
@interface DWlabel (FontSize)

@end
/*------ 有关Button---------*/

@interface UIButton (FontSize)

@end
@interface DWButtion (FontSize)

@end
/*------ 有关TextField---------*/
@interface UITextField (FontSize)

@end

@interface DWTextfield (FontSize)

@end
/*------ 有关TextView---------*/
@interface UITextView (FontSize)

@end
@interface DWTextView (FontSize)

@end
/*------ 有关约束---------*/
@interface NSLayoutConstraint (Size)

@end
/*------ 有关约束---------*/
@interface DWImageView (Size)

@end
@implementation UILabel (FontSize)
#pragma mark - 关于UILabel
+ (void)load{
   // if(!UILabelEnable) return;
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
    
//    Method cmp = class_getInstanceMethod([self class], @selector(initWithFrame:));
//    Method myCmp = class_getInstanceMethod([self class], @selector(myInitWithFrame:));
//    method_exchangeImplementations(myCmp, cmp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode {
    [self myInitWithCoder:aDecode];
    if (self) {
//        //代码创建的时候 还不能拿到之后设置的tag 所以无法判断忽略项
//        NSArray *ignoreTags = [UIView getIgnoreTags];
//        for (NSNumber *num in ignoreTags) {
//            if(self.tag == num.integerValue) return self;
//        }
        CGFloat fontSize = self.font.pointSize;
        CGFloat scale = [UIView getFontScale];
        self.font = [self.font fontWithSize:fontSize*(scale?:ScrenScale)];
    }
    return self;
}


//- (id)myInitWithFrame:(CGRect)frame{
//    [self myInitWithFrame:frame];
//    if(self){
////        //代码创建的时候 还不能拿到之后设置的tag 所以无法判断忽略项
////        NSArray *ignoreTags = [UIView getIgnoreTags];
////        for (NSNumber *num in ignoreTags) {
////            if(self.tag == num.integerValue) return self;
////        }
//        CGFloat fontSize = self.font.pointSize;
//        CGFloat scale = [UIView getFontScale];
//        self.font = [self.font fontWithSize:fontSize*(scale?:ScrenScale)];
//    }
//    return self;
//}

@end
@implementation DWlabel (FontSize)
#pragma mark - 有关DWlabel
+ (void)load{
     if(!DWlabelEnable) return;
    
    Method cmp = class_getInstanceMethod([self class], @selector(initWithFrame:Font:));
    Method myCmp = class_getInstanceMethod([self class], @selector(myInitWithFrame:Font:));
    method_exchangeImplementations(myCmp, cmp);
}
- (id)myInitWithFrame:(CGRect)frame Font:(CGFloat)font{
    [self myInitWithFrame:frame Font:font];
    if(self){
       
        CGFloat scale = [UIView getFontScale];
        self.font = [self.font fontWithSize:font*(scale?:ScrenScale)];
        CGRect  myframe ;
        myframe.origin.x = frame.origin.x*(scale?:W);
        myframe.origin.y = frame.origin.y*(scale?:ScrenScale);
        myframe.size.width = frame.size.width*(scale?:W);
        myframe.size.height = frame.size.height*(scale?:ScrenScale);
        self.frame = myframe;
       

    }
    return self;
}

@end
@implementation UIButton (FontSize)
#pragma mark - 有关UIButton
+ (void)load {
    if(!UIButtonEnable) return;

    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
    
    Method cmp = class_getInstanceMethod([self class], @selector(initWithFrame:));
    Method myCmp = class_getInstanceMethod([self class], @selector(myInitWithFrame:));
    method_exchangeImplementations(cmp, myCmp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode {
    [self myInitWithCoder:aDecode];
    if (self) {
        NSArray *ignoreTags = [UIView getIgnoreTags];
        for (NSNumber *num in ignoreTags) {
            if(self.tag == num.integerValue) return self;
        }
        CGFloat fontSize = self.titleLabel.font.pointSize;
        CGFloat scale = [UIView getFontScale];
        self.titleLabel.font = [self.titleLabel.font fontWithSize:fontSize*(scale?:ScrenScale)];
    }
    return self;
}

- (id)myInitWithFrame:(CGRect)frame{
    [self myInitWithFrame:frame];
    if(self){
//        //代码创建的时候 还不能拿到之后设置的tag 所以无法判断忽略项
//        NSArray *ignoreTags = [UIView getIgnoreTags];
//        for (NSNumber *num in ignoreTags) {
//            if(self.tag == num.integerValue) return self;
//        }
        CGFloat fontSize = self.titleLabel.font.pointSize;
        CGFloat scale = [UIView getFontScale];
        self.titleLabel.font = [self.titleLabel.font fontWithSize:fontSize*(scale?:ScrenScale)];
    }
    return self;
}

@end

@implementation DWButtion (FontSize)
#pragma mark - 有关DWButtion
+ (void)load{
    if(!DWButtionEnable) return;
    
    Method cmp = class_getInstanceMethod([self class], @selector(initWithFrame:Font:));
    Method myCmp = class_getInstanceMethod([self class], @selector(myInitWithFrame:Font:));
    method_exchangeImplementations(myCmp, cmp);
}
- (id)myInitWithFrame:(CGRect)frame Font:(CGFloat)font{
    [self myInitWithFrame:frame Font:font];
    if(self){
        
        CGFloat scale = [UIView getFontScale];
        self.titleLabel.font = [self.titleLabel.font fontWithSize:font*(scale?:ScrenScale)];
        //NSLog(@"DWBtn--%f",self.titleLabel.font.pointSize);
        CGRect  myframe ;
        myframe.origin.x = frame.origin.x*(scale?:W);
        myframe.origin.y = frame.origin.y*(scale?:ScrenScale);
        myframe.size.width = frame.size.width*(scale?:W);
        myframe.size.height = frame.size.height*(scale?:ScrenScale);
        self.frame = myframe;
    }
    return self;
}

@end
@implementation UITextField (FontSize)
#pragma mark - 有关UITextField
+ (void)load {
    if(!UITextFieldEnable) return;

    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
    
    Method cmp = class_getInstanceMethod([self class], @selector(initWithFrame:));
    Method myCmp = class_getInstanceMethod([self class], @selector(myInitWithFrame:));
    method_exchangeImplementations(cmp, myCmp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode {
    [self myInitWithCoder:aDecode];
    if (self) {
        NSArray *ignoreTags = [UIView getIgnoreTags];
        for (NSNumber *num in ignoreTags) {
            if(self.tag == num.integerValue) return self;
        }
        CGFloat fontSize = self.font.pointSize;
        CGFloat scale = [UIView getFontScale];
        self.font = [self.font fontWithSize:fontSize*(scale?:ScrenScale)];
    }
    return self;
}

- (id)myInitWithFrame:(CGRect)frame{
    [self myInitWithFrame:frame];
    if(self){
//        //代码创建的时候 还不能拿到之后设置的tag 所以无法判断忽略项
//        NSArray *ignoreTags = [UIView getIgnoreTags];
//        for (NSNumber *num in ignoreTags) {
//            if(self.tag == num.integerValue) return self;
//        }
        CGFloat fontSize = self.font.pointSize;
        CGFloat scale = [UIView getFontScale];
        self.font = [self.font fontWithSize:fontSize*(scale?:ScrenScale)];
    }
    return self;
}

@end
@implementation DWTextfield (FontSize)
#pragma mark - 有关DWTextfield
+ (void)load{
    if(!DWTextfieldEnable) return;
    
    Method cmp = class_getInstanceMethod([self class], @selector(initWithFrame:Font:));
    Method myCmp = class_getInstanceMethod([self class], @selector(myInitWithFrame:Font:));
    method_exchangeImplementations(myCmp, cmp);
}
- (id)myInitWithFrame:(CGRect)frame Font:(CGFloat)font{
    [self myInitWithFrame:frame Font:font];
    if(self){
        
        CGFloat scale = [UIView getFontScale];
        self.font = [self.font fontWithSize:font*(scale?:ScrenScale)];
        CGRect  myframe ;
        myframe.origin.x = frame.origin.x*(scale?:W);
        myframe.origin.y = frame.origin.y*(scale?:ScrenScale);
        myframe.size.width = frame.size.width*(scale?:W);
        myframe.size.height = frame.size.height*(scale?:ScrenScale);
        self.frame = myframe;
    }
    return self;
}

@end
@implementation UITextView (FontSize)
#pragma mark - 有关UITextView
+ (void)load {
    if(!UITextViewEnable) return;

    Method ibImp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myIbImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(ibImp, myIbImp);
    
//    Method cmp = class_getInstanceMethod([self class], @selector(initWithFrame:));
//    Method myCmp = class_getInstanceMethod([self class], @selector(myInitWithFrame:));
//    method_exchangeImplementations(cmp, myCmp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode {
    [self myInitWithCoder:aDecode];
    if (self) {
        NSArray *ignoreTags = [UIView getIgnoreTags];
        for (NSNumber *num in ignoreTags) {
            if(self.tag == num.integerValue) return self;
        }
        CGFloat fontSize = self.font.pointSize;
        CGFloat scale = [UIView getFontScale];
        self.font = [self.font fontWithSize:fontSize*(scale?:ScrenScale)];
    }
    return self;
}

//- (id)myInitWithFrame:(CGRect)frame{
//    [self myInitWithFrame:frame];
//    if(self){
//        //textView 此时的 self.font 还是 nil 所以无法修改
//        CGFloat fontSize = self.font.pointSize;
//        self.font = [self.font fontWithSize:fontSize*ScrenScale];
//    }
//    return self;
//}


@end
@implementation DWTextView (FontSize)
#pragma mark - 有关DWTextfield
+ (void)load{
    if(!DWTextViewEnable) return;
    Method cmp = class_getInstanceMethod([self class], @selector(initWithFrame:Font:));
    Method myCmp = class_getInstanceMethod([self class], @selector(myInitWithFrame:Font:));
    method_exchangeImplementations(myCmp, cmp);
}
- (id)myInitWithFrame:(CGRect)frame Font:(CGFloat)font{
    [self myInitWithFrame:frame Font:font];
    if(self){
        
        CGFloat scale = [UIView getFontScale];
        self.font = [self.font fontWithSize:font*(scale?:ScrenScale)];
        CGRect  myframe ;
        myframe.origin.x = frame.origin.x*(scale?:W);
        myframe.origin.y = frame.origin.y*(scale?:ScrenScale);
        myframe.size.width = frame.size.width*(scale?:W);
        myframe.size.height = frame.size.height*(scale?:ScrenScale);
        self.frame = myframe;

    }
    return self;
}

@end

@implementation NSLayoutConstraint (Size)
#pragma mark - 有关约束Constraint
+ (void)load {
    if(!NSLayoutConstraintEnable) return;
    
    Method ibImp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myIbImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(ibImp, myIbImp);
    
    }

- (id)myInitWithCoder:(NSCoder*)aDecode {
    [self myInitWithCoder:aDecode];
    if (self) {
        CGFloat fontSize = self.constant;
        CGFloat scale = [UIView getFontScale];
        self.constant = fontSize*(scale?:ScrenScale);
     NSLog(@"--------%f",self.constant);
    }
    return self;
}
@end
@implementation DWImageView (FontSize)
#pragma mark - 有关UIImageView
+ (void)load {
    if(!DWImageViewEnable) return;
    
//    Method ibImp = class_getInstanceMethod([self class], @selector(initWithCoder:));
//    Method myIbImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
//    method_exchangeImplementations(ibImp, myIbImp);
//    
        Method cmp = class_getInstanceMethod([self class], @selector(initWithFrame:));
        Method myCmp = class_getInstanceMethod([self class], @selector(myInitWithFrame:));
        method_exchangeImplementations(cmp, myCmp);
}

//- (id)myInitWithCoder:(NSCoder*)aDecode {
//    [self myInitWithCoder:aDecode];
//    if (self) {
//       
//    }
//    return self;
//}

- (id)myInitWithFrame:(CGRect)frame{
    [self myInitWithFrame:frame];
    if(self){
        CGFloat scale = [UIView getFontScale];
        CGRect  myframe ;
        myframe.origin.x = frame.origin.x*(scale?:W);
        myframe.origin.y = frame.origin.y*(scale?:ScrenScale);
        myframe.size.width = frame.size.width*(scale?:W);
        myframe.size.height = frame.size.height*(scale?:ScrenScale);
        NSLog(@"%f", myframe.size.height);
        self.frame = myframe;

    }
    return self;
}




@end
