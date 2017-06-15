//
//  ViewController.m
//  使用其他APP打开文档
//
//  Created by 席亚坤 on 2017/6/15.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIDocumentInteractionControllerDelegate>{
    UIDocumentInteractionController *  documentController ;
}

@end

@implementation ViewController
- (IBAction)HHH:(id)sender {
    documentController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:NSHomeDirectory()]];
    documentController.delegate = self;
    documentController.UTI = @"com.microsoft.word.doc";
    [documentController presentOpenInMenuFromRect:CGRectZero inView:self.view animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)documentInteractionController:(UIDocumentInteractionController *)controller

       willBeginSendingToApplication:(NSString *)application

{
    
    //将要发送的应用
    
}

//下面是他的代理方法

-(void)documentInteractionController:(UIDocumentInteractionController *)controller

          didEndSendingToApplication:(NSString *)application

{
    
    //已经发送的应用
    
}

-(void)documentInteractionControllerDidDismissOpenInMenu:

(UIDocumentInteractionController *)controller

{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
