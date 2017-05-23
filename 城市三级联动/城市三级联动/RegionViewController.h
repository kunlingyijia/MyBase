//
//  RegionViewController.h
//  test
//
//  Created by 席亚坤 on 16/11/18.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ReturnData)(NSDictionary*reqionDic );
@interface RegionViewController : UIViewController
-(void)ReqionReturn:(ReturnData)data;

///block
@property (nonatomic, copy) ReturnData returnData ;
@property (weak, nonatomic) IBOutlet UIView *underView;


@end
