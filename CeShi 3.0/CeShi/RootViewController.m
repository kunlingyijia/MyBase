//
//  RootViewController.m
//  CeShi
//
//  Created by 席亚坤 on 16/11/22.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "RootViewController.h"
#import "NetManager.h"
#import "AFHTTPSessionManager.h"

@interface RootViewController ()<UIWebViewDelegate>


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建一个UIWebView对象
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    //给webView指定代理为控制器
    webView.delegate = self;
    
    //[webView scalesPageToFit];
    
    //方法一: 直接加载URL
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.taobao.com"]];
    //用webView来加载网络请求
     [webView loadRequest:request];
    //[webView loadHTMLString:@"https://img.zgduifubao.com/1.json" baseURL:nil];

//    [NetManager getRequestwithURL:@"https://img.zgduifubao.com/1.php" withparameters:nil withSuccessResult:^(id successResult) {
//        NSLog(@"%@",successResult);
//        
////         [webView loadHTMLString:successResult[@"details"] baseURL:nil];
//    } withErrorResult:^(NSError *errorResult) {
    
    //}];
    
    NSString *str =  [[NSBundle mainBundle]pathForResource:@"text.plist" ofType:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:str];
    //NSLog(@"%@",dic);
    //方法二: 加载自己用字符串拼接的HTML代码, 也可以加载javascript代码
        //NSString *html =[NSString str
    //    // @"hello <h1>world<h1>"
    //    // @"<script language='javascript'>alert('hello');</script>'"
   // [webView loadHTMLString:dic[@"text"] baseURL:nil];
    
    
    //放法三:使用UIWebView加载已经存在的本地HTML页面
    //    NSString *path = [[NSBundle mainBundle] pathForResource:@"北京蓝鸥科技有限公司_百度百科" ofType:@"html"];
    //    //把数据读取到NSData中
    //    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    //
    //    //最后，使用loadData方法对文件进行加载，并且指定类型（mimetype）和编码类型（textEncodingName）
    //    [webView loadData:data MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:nil];
    //
    //    其中MINEType可以设置成@"text/html"
    //    textEncodingName可以设置成@"GBK" @"UTF-8"
    //    为什么需要设置baseUrl？也就是data中有一些链接是图片，css都是外部文件，然后这些文件需要到一个目录上去找。baseUrl就是这个目录
    
    
}

#pragma mark ---- UIWebViewDelegate

//在webView加载任何一个frame之前都会执行delegate对象的该方法, 该方法的返回值用以控制是否允许加载目标链接页面的内容，返回YES将直接加载内容，NO则反之
//参数1: 当前进行网络请求的webView
//参数2: 将要发起的reguest请求
//参数3: 开始加载时reguest, 用户的行为
//UIWebViewNavigationTypeLinkClicked, 用户触击一个链接
//UIWebViewNavigationTypeFormSubmitted, 用户提交了一个表单
//UIWebViewNavigationTypeBackForward, 用户触击前进或者返回一个按钮
//UIWebViewNavigationTypeReload, 用户触击重新加载按钮
//UIWebViewNavigationTypeFormResubmitted, 用户重复提交表单
//UIWebViewNavigationTypeOther, 发生其他行为
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"1加载前");
    
    return YES;
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"2已经开始加载");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"3已经加载完成");
    
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"加载失败");
    //加载失败可以打印错误原因
    NSLog(@"%@", error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
