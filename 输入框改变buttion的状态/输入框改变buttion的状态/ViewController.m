//
//  ViewController.m
//  输入框改变buttion的状态
//
//  Created by 席亚坤 on 16/11/20.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"
#import "ChangeValue.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *selectAreaBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property(nonatomic,strong)ChangeValue*changeV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.changeV = [[ChangeValue alloc]init];
    [_changeV addObserver:self forKeyPath:@"passwordTF" options:NSKeyValueObservingOptionNew context:nil];
     [_changeV addObserver:self forKeyPath:@"selectAreaBtn" options:NSKeyValueObservingOptionNew context:nil];
     [_changeV addObserver:self forKeyPath:@"nameTF" options:NSKeyValueObservingOptionNew context:nil];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(nullable NSDictionary<NSKeyValueChangeKey,id> *)change context:(nullable void *)context{
    if ([keyPath isEqualToString:@"selectAreaBtn"]) {
        NSLog(@"button--改变了%@",change[@"new"]);
//        selectAreaBtn =change[@"new"];
    }
    if ([keyPath isEqualToString:@"nameTF"]) {
//         NSLog(@"name--改变了%@",change);
//        nameTF =change[@"new"];
    }
    if ([keyPath isEqualToString:@"passwordTF"]) {
//         NSLog(@"密码--改变了%@",change);
//        passwordTF =change[@"new"];
    }
   

    if (self.nameTF.text.length ==0||self.passwordTF.text.length ==0||[self.selectAreaBtn.titleLabel.text isEqualToString:@"请选择地区"]) {
        self.loginBtn.userInteractionEnabled = NO;
        self.loginBtn.backgroundColor = [UIColor grayColor];
    }else{
        self.loginBtn.userInteractionEnabled = YES;
        self.loginBtn.backgroundColor = [UIColor redColor];
    }
}
- (IBAction)TFValueTFAction:(UITextField *)sender {
    if (self.nameTF ==sender) {
        _changeV.nameTF = self.nameTF.text;
    }
    if (_passwordTF==sender) {
        _changeV.passwordTF = self.passwordTF.text;
    }
}

- (IBAction)touchDown:(UIButton *)sender {
    [self.selectAreaBtn setTitle:@"北京" forState:(UIControlStateNormal)];

}



- (IBAction)selectAreaTFChangeValue:(UIButton *)sender {
    
    
    _changeV.selectAreaBtn = self.selectAreaBtn.titleLabel.text;
}
- (void)dealloc
{
    [self.changeV removeObserver:self forKeyPath:@"passwordTF"];
     [self.changeV removeObserver:self forKeyPath:@"nameTF"];
     [self.changeV removeObserver:self forKeyPath:@"selectAreaBtn"];
}
- (IBAction)loginAction:(UIButton *)sender {
    //Push 跳转
    RootViewController * VC = [[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
    [self.navigationController  pushViewController:VC animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
