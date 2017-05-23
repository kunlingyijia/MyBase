//
//  RootViewController.m
//  输入框改变buttion的状态
//
//  Created by 席亚坤 on 16/11/20.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *selectAreaBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_selectAreaBtn addObserver:self forKeyPath:@"titleLabel.text" options:NSKeyValueObservingOptionNew context:nil];
    [_nameTF addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    [_passwordTF addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    [_imgView addObserver:self forKeyPath:@"tag" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:nil];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(nullable NSDictionary<NSKeyValueChangeKey,id> *)change context:(nullable void *)context{
    
//    if (object == _selectAreaBtn &&[keyPath isEqualToString:@"titleLabel.text"]) {
//                NSLog(@"button--改变了%@",change[@"new"]);
//        //        selectAreaBtn =change[@"new"];
//    }
//    if (object == _nameTF &&[keyPath isEqualToString:@"text"]) {
//                 NSLog(@"name--改变了%@",change);
//        //        nameTF =change[@"new"];
//    }
//    if (object == _passwordTF &&[keyPath isEqualToString:@"text"]) {
//                NSLog(@"密码--改变了%@",change);
//        //        passwordTF =change[@"new"];
//    }
    if (object == _imgView&&[keyPath isEqualToString:@"tag"]) {
        NSLog(@"图片--改变了%@",change);
        
    }
    
    if (self.nameTF.text.length ==0||self.passwordTF.text.length ==0||_imgView.tag ==0 ||[self.selectAreaBtn.titleLabel.text isEqualToString:@"请选择地区"]) {
        self.loginBtn.userInteractionEnabled = NO;
        self.loginBtn.backgroundColor = [UIColor grayColor];
    }else{
        self.loginBtn.userInteractionEnabled = YES;
        self.loginBtn.backgroundColor = [UIColor redColor];
    }
}
- (IBAction)TFValueTFAction:(UITextField *)sender {
    if ((sender= _nameTF )) {
        sender.text = _nameTF.text;
    }
    if ((sender=_passwordTF)) {
        sender.text = _passwordTF.text;
    }
}
- (IBAction)selectAreaTFChangeValue:(UIButton *)sender {
    if ((sender =self.selectAreaBtn)) {
    [self.selectAreaBtn setTitle:@"北京" forState:(UIControlStateNormal)];
        _imgView.image = [UIImage imageNamed:@"暂无数据"];
        _imgView.tag = 100;
    }
   
}
- (void)dealloc
{
    [_selectAreaBtn removeObserver:self forKeyPath:@"titleLabel.text"];
    [_passwordTF removeObserver:self forKeyPath:@"text"];
    [_nameTF removeObserver:self forKeyPath:@"text"];
    [_imgView removeObserver:self
                  forKeyPath:@"tag"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
