//
//  ViewController.m
//  url:http://www.xiongcaichang.com
//
//  Created by bear on 16/4/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+ScalableCover.h"
#import "HeaderView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()


@property (nonatomic, assign) BOOL refreshStatus;


@property (nonatomic, assign) NSInteger dataCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataCount=5;
//    HeaderView *headerView =[[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:nil options:nil].lastObject;
//    headerView.frame= CGRectMake(0, 0, SCREEN_WIDTH, 200);
//    self.tableView.tableHeaderView= headerView;
    self.tableView.tableHeaderView=[[UITableViewHeaderFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];


#warning 该行代码添加下拉缩放图
    [self.tableView addScalableCoverWithImage:[UIImage imageNamed:@"mebg"]];
}

//监听滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if ( scrollView.contentOffset.y>-50) {
        [self  loadMore];
        [self.tableView reloadData];
    }
}


//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataCount;
}



//返回cell

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]init];
    }
    cell.textLabel.text=@"1234";

    return cell;
}



//获取刷新数据
-(void)loadMore{

    self.dataCount=20;
}
@end
