//
//  FuWenBenViewController.m
//  原生二维码
//
//  Created by 席亚坤 on 16/9/10.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "FuWenBenViewController.h"
#define font 13
@interface FuWenBenViewController ()<UITextViewDelegate>
 @property (weak, nonatomic) IBOutlet UITextView *textview;
 @property (assign, nonatomic) BOOL isSelect;

@end

@implementation FuWenBenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self protocolIsSelect:self.isSelect];
}
- (void)protocolIsSelect:(BOOL)select {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"请遵守以下协议\n《支付宝协议和服务协议》"];
         [attributedString addAttribute:NSLinkAttributeName
                                          value:@"zhifubao://"
                                          range:[[attributedString string] rangeOfString:@"支付宝协议和服务协议"]];
    
         UIImage *image = [UIImage imageNamed:select == YES ? @"new_feature_share_true" : @"new_feature_share_false"];
         CGSize size = CGSizeMake(font + 2, font + 2);
         UIGraphicsBeginImageContextWithOptions(size, false, 0);
         [image drawInRect:CGRectMake(0, 2, size.width, size.height)];
         UIImage *resizeImage = UIGraphicsGetImageFromCurrentImageContext();
         UIGraphicsEndImageContext();
         NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
         textAttachment.image = resizeImage;
         NSMutableAttributedString *imageString = [NSMutableAttributedString attributedStringWithAttachment:textAttachment];
         [imageString addAttribute:NSLinkAttributeName
                                          value:@"checkbox://"
                                          range:NSMakeRange(0, imageString.length)];
         [attributedString insertAttributedString:imageString atIndex:0];
         [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(0, attributedString.length)];
         _textview.attributedText = attributedString;
         _textview.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor],
                                                                                  NSUnderlineColorAttributeName: [UIColor lightGrayColor],
                                                                                  NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    
         _textview.delegate = self;
         _textview.editable = NO;        //必须禁止输入，否则点击将弹出输入键盘
         _textview.scrollEnabled = NO;
     }

 - (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
         if ([[URL scheme] isEqualToString:@"zhifubao"]) {
       NSLog(@"支付宝支付---------------");                 return NO;
             }
         else if ([[URL scheme] isEqualToString:@"checkbox"]) {
                             self.isSelect = !self.isSelect;
                             [self protocolIsSelect:self.isSelect];
                             return NO;
                         }
         return YES;
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
