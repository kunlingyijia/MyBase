//
//  NIBHelper.m
//  UIView-XIB
//
//  Created by 席亚坤 on 16/9/26.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "NIBHelper.h"

@implementation NIBHelper


+ (id)instanceFromNib:(NSString*)nibName{
    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    
    return  [objects objectAtIndex:0];
}
@end
