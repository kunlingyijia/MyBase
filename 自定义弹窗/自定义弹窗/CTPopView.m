//
//  PopView.m
//  Carriage
//
//  Created by Fylian on 16/11/16.
//  Copyright © 2016年 Fylian. All rights reserved.
//

#import "CTPopView.h"
#import "CTPopViewSingle.h"

#define CTNUMBER 1
@implementation CTPopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype) init {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame
                     menuWidth:(CGFloat)menuWidth
                         items:(NSArray *)items
                        action:(void(^)(NSInteger index))action {
    if (self = [super initWithFrame:frame]) {
        self.menuWidth = menuWidth;
        self.menuItem = items;
        self.action = [action copy];
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(-self.menuWidth/20, 16,  self.menuWidth/4, 40 * self.menuItem.count) style:UITableViewStylePlain];
        self.tableView.scrollEnabled = NO;
        self.tableView.dataSource = self;
        self.tableView.delegate   = self;
        self.tableView.layer.cornerRadius = 10.0f;
        self.tableView.layer.anchorPoint = CGPointMake(1.0, 0);
        self.tableView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        //self.tableView.rowHeight = 40;
        
        
        [self addSubview:self.tableView];
        
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [self.tableView setLayoutMargins:UIEdgeInsetsZero];
        }
        
    }
    return self;
}


- (CGRect)menuFrame {
    CGFloat menuX = 0;
    CGFloat menuY = 0;
    CGFloat width = self.menuWidth;
    CGFloat heigh = 40 * CTNUMBER;
    return (CGRect){menuX,menuY,width,heigh};
}

#pragma mark 绘制三角形
- (void)drawRect:(CGRect)rect

{
    
    // 设置背景色
    [[UIColor whiteColor] set];
    //拿到当前视图准备好的画板
    
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
    CGFloat location = [UIScreen mainScreen].bounds.size.width;
    CGContextMoveToPoint(context,
                         20+30, 75);//设置起点
    
    CGContextAddLineToPoint(context,
                             2*10+30 + 10 ,  65);
    
    CGContextAddLineToPoint(context,
                             10 * 3 +10+30, 75);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [[UIColor whiteColor] setFill];  //设置填充色
    
    [[UIColor whiteColor] setStroke]; //设置边框颜色
    
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[CTPopViewSingle shareManager] hideMenu];
}

#pragma mark -UITableViewDelegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifeir = @"identifier111";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifeir];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifeir];
    }
    cell.textLabel.text = self.menuItem[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    //cell.imageView.image = [UIImage imageNamed:self.menuItem[0][indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(self.action){
        self.action(indexPath.row);
    }
}

@end
