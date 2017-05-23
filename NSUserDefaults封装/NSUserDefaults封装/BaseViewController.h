//
//  BaseViewController.h
//  NSUserDefaults封装
//
//  Created by 席亚坤 on 16/10/28.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^OKDefault)(UIAlertAction*defaultaction);
typedef void(^Cancel)(UIAlertAction *cancelaction);
@interface BaseViewController : UIViewController

-(void)alertWithTitle:(NSString*)title message:(NSString*)message OKWithTitle:(NSString*)OKtitle  CancelWithTitle:(NSString*)Canceltitle withOKDefault:(OKDefault)defaultaction withCancel:(Cancel)cancelaction;
-(void)alertActionSheetWithTitle:(NSString*)title message:(NSString*)message OKWithTitle:(NSString*)OKtitle  CancelWithTitle:(NSString*)Canceltitle withOKDefault:(OKDefault)defaultaction withCancel:(Cancel)cancelaction;



@end
