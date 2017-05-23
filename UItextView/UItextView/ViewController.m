//
//  ViewController.m
//  UItextView
//
//  Created by 席亚坤 on 17/2/25.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"
//#import "UITextView+Data.h"
#import "EZTextView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet EZTextView *testTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  self.testTF.placeholder = @"哎呀我去..";
  self.testTF.placeholderColor = [UIColor redColor];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
