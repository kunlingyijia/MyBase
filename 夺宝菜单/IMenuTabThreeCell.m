//
//  IMenuTabThreeCell.m
//  夺宝分类
//
//  Created by 席亚坤 on 17/4/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//
#define IMenuWidth [UIScreen mainScreen].bounds.size.width
#import "IMenuTabThreeCell.h"
#import "UIButton+LXMImagePosition.h"
@interface IMenuTabThreeCell ()
///数据
@property (nonatomic,strong)NSMutableArray * dataArray;
//@property(nonatomic,strong)NSString *IsOpen;
@property(nonatomic,strong)UIView *redView;
@end
@implementation IMenuTabThreeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    for (int i=2; i<5; i++) {
        UIButton *btn = [self viewWithTag:100+i];
        [btn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        
    }
    //Cell背景颜色
    //    self.contentView.backgroundColor = [UIColor colorWithHexString:kViewBg];
    //cell选中时的颜色 无色
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //Cell右侧箭头
    //self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    self.separatorInset = UIEdgeInsetsMake(0, IMenuWidth, 0, 0); // ViewWidth  [宏] 指的是手机屏幕的宽度
    
    [self.OneBtn setImagePosition:LXMImagePositionRight spacing:0.f];
    [self.FiveBtn setImagePosition:LXMImagePositionRight spacing:0.f];
}
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }return _dataArray;
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.IsOpen = @"0";
        self.IsUp = @"0";
        //[self addSubViews];
        self.redView = [[UIView alloc]init ];
        _redView.frame =CGRectMake(0, IMenuWidth*0.12-2, IMenuWidth/4, 2);
        _redView.backgroundColor = [UIColor redColor];
        [self addSubview:_redView];
        [self.OneBtn setImagePosition:LXMImagePositionRight spacing:0.f];
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //[self addSubViews];
        self.IsOpen = @"0";
        self.IsUp = @"0";
        self.redView = [[UIView alloc]init ];
        _redView.frame =CGRectMake(0, IMenuWidth*0.12-2, IMenuWidth/4, 2);
        _redView.backgroundColor = [UIColor redColor];
        [self addSubview:_redView];
        [self.OneBtn setImagePosition:LXMImagePositionRight spacing:0.f];
    }
    return self;
}



- (IBAction)IMenuTabOneCellBtnAction:(UIButton *)sender {
    
    UIView * view =[sender superview];
    [UIView animateWithDuration:0.2 animations:^{
        _redView.frame = CGRectMake(view.frame.origin.x, view.frame.size.height, view.frame.size.width, _redView.frame.size.height);
        
    }];
    
    if (sender.tag ==100) {
        self.IsUp = @"0";
        [self.FiveBtn setImage:[UIImage imageNamed:@"全灰"] forState:(UIControlStateNormal)];
        if ([self.IsOpen isEqualToString:@"0"]) {
            self.IsOpen = @"1";
            [self.OneBtn setImage:[UIImage imageNamed:@"红下"] forState:(UIControlStateNormal)];
            
        }else{
            self.IsOpen = @"0";
            [self.OneBtn setImage:[UIImage imageNamed:@"灰下"] forState:(UIControlStateNormal)];
        }
    }else{
        
        self.IsOpen = @"0";
        [self.OneBtn setImage:[UIImage imageNamed:@"灰下"] forState:(UIControlStateNormal)];
        
        if (sender.tag ==104){
            //0 全灰 0 上灰下红 1 上红下灰
            
            if ([self.IsUp isEqualToString:@"0"]){
                self.IsUp = @"1";
                [self.FiveBtn setImage:[UIImage imageNamed:@"上灰下红"] forState:(UIControlStateNormal)];
            }else if ([self.IsUp isEqualToString:@"1"]){
                self.IsUp = @"0";
                [self.FiveBtn setImage:[UIImage imageNamed:@"上红下灰"] forState:(UIControlStateNormal)];
            }
            
        }else{
            self.IsUp = @"0";
            [self.FiveBtn setImage:[UIImage imageNamed:@"全灰"] forState:(UIControlStateNormal)];
        }
    }
    self.IMenuTabThreeCellBlock(sender.tag-100,self.IsOpen ,self.IsUp);
    
    for (int i=1; i<5; i++) {
        UIButton *btn = [self viewWithTag:100+i];
        [btn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        
    }
    [sender setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    
    
    
}

@end
