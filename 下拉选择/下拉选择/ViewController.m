//
//  ViewController.m
//  下拉选择
//
//  Created by 席亚坤 on 17/5/4.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "PopoverView.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *Btn;
@property (nonatomic, strong)NSArray    *ZWLanguageListArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *ZWLanguageListArr=[NSArray arrayWithObjects:@"en(英语)",@"es(西班牙)",@"fr(法语)",@"de(德语)",@"it(意大利)",@"pt(葡萄牙)" ,nil];
    self.ZWLanguageListArr=ZWLanguageListArr;
}

- (IBAction)BtnAction:(UIButton *)sender {
    
    //点击按钮的响应事件；
    NSMutableArray *tmp=[NSMutableArray array];
    __weak typeof(self) weakSelf = self;
    for (int i=0; i<self.ZWLanguageListArr.count; i++) {
        PopoverAction *action = [PopoverAction actionWithTitle:self.ZWLanguageListArr[i] handler:^(PopoverAction *action) {
            [sender setTitle: [action.title substringWithRange:NSMakeRange(0,2)] forState:0] ;
            NSLog(@"%@ tmpstr",[action.title substringWithRange:NSMakeRange(0,2)]);
//            weakSelf.textContentView.text=nil;
//            weakSelf.languageNum=i;
        }];
        [tmp addObject:action];
        
        
    }
    
    PopoverView *popoverView = [PopoverView popoverView];
    [popoverView showToView:sender withActions:[NSArray arrayWithArray:tmp]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
