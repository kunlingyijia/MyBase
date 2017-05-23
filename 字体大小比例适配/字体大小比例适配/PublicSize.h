//
//  PublicSize.h
//  字体大小比例适配
//
//  Created by 席亚坤 on 17/3/1.
//  Copyright © 2017年 席亚坤. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PublicSize : NSObject

@end

/////               标签***************************************************************************************************************************************************************************************************////

@interface OneLabel : UILabel
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;


@end

@interface TwoLabel : UILabel
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end
@interface ThreeLabel : UILabel
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end

@interface FourLabel : UILabel
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end

/////               按钮***************************************************************************************************************************************************************************************************////


@interface OneBtn : UIButton
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end



@interface TwoBtn : UIButton
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end


@interface ThreeBtn : UIButton
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end

@interface FourBtn : UIButton
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end



/////               输入框***************************************************************************************************************************************************************************************************////


@interface OneTF : UITextField
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end

@interface TwoTF : UITextField
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end

@interface ThreeTF : UITextField
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end

@interface FourTF : UITextField
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end




/////               输入栏***************************************************************************************************************************************************************************************************////


@interface OneTV : UITextView
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end

@interface TwoTV : UITextView
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end

@interface ThreeTV : UITextView
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end

@interface FourTV : UITextView
///indexPath
@property (nonatomic, strong) NSIndexPath  *indexPath ;
@end
