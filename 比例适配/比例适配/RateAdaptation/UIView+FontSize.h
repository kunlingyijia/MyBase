//
//  UIView+FontSize.h
//  FontSizeModify
//
//  Created by dyw on 16/10/22.
//  Copyright © 2016年 dyw. All rights reserved.
//

#import <UIKit/UIKit.h>
/*适用于可视化编程*/
#define UITextViewEnable 1
#define UITextFieldEnable 1
#define UIButtonEnable 1
#define UILabelEnable 1
#define NSLayoutConstraintEnable 1

/*自定控件*/
#define DWImageViewEnable 1

#define DWlabelEnable 1
#define DWButtionEnable 1
#define DWTextfieldEnable 1
#define DWTextViewEnable 1


@interface UIView (FontSize)

/**
 设置需要忽略的空间tag值

 @param tagArr tag值数组
 */
+ (void)setIgnoreTags:(NSArray<NSNumber*> *)tagArr;

/**
 设置字体大小比例
 @param value 需要设置的比例
 */
+ (void)setFontScale:(CGFloat)value;

@end

