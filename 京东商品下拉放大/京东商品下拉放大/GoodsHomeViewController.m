//
//  GoodsHomeViewController.m
//  京东商品下拉放大
//
//  Created by 席亚坤 on 16/12/27.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "GoodsHomeViewController.h"
#import "FXBlurView.h"

@interface GoodsHomeViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    UIScrollView* rootview;
    CGFloat subviews_h;
    
    //
    CGFloat screen_width;
    CGFloat screen_height;
    
    //
    UIImageView* headerimgview;
    CGRect headerv_firstrect;
    
    FXBlurView* contentview;
}
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation GoodsHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    screen_width = [UIScreen mainScreen].bounds.size.width;
    screen_height = [UIScreen mainScreen].bounds.size.height;
    
    //
    self.view.backgroundColor = [UIColor colorWithRed:0.157 green:0.169 blue:0.208 alpha:1];
    
    rootview = [[UIScrollView alloc] initWithFrame:CGRectZero];
    rootview.backgroundColor = [UIColor greenColor];
    rootview.delegate = self;
    [self.view addSubview:rootview];
    
   
    [self addHeaderImageView];
    [self addContentView];
    
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    rootview.frame = self.view.bounds;
}


#pragma mark - 记录相对位置

- (void)addSubview:(UIView*)view{
    //
    [rootview addSubview:view];
    subviews_h += view.bounds.size.height;
    rootview.contentSize = CGSizeMake(rootview.bounds.size.width, subviews_h);
    
}

#pragma mark - 添加子视图
- (void)addHeaderImageView{
    //
    headerv_firstrect = CGRectMake(0, subviews_h, screen_width, screen_width*0.5);
    headerimgview = [[UIImageView alloc] initWithFrame:headerv_firstrect];
    headerimgview.userInteractionEnabled = YES;
    headerimgview.contentMode = UIViewContentModeScaleAspectFill;
    headerimgview.image = [UIImage imageNamed:@"Eason.jpg"];
    [self addSubview:headerimgview];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionOfTest)];
    [headerimgview addGestureRecognizer:tap];
}

- (void)actionOfTest{
    //
    UIAlertView* alv = [[UIAlertView alloc] initWithTitle:@"" message:@"🎄圣诞快乐🎄" delegate:nil cancelButtonTitle:@"😁" otherButtonTitles: nil];
    [alv show];
}

- (void)addContentView{
    //
    contentview = [[FXBlurView alloc] initWithFrame:CGRectMake(0, subviews_h, screen_width, 0)];
    contentview.tintColor = [UIColor clearColor];
    //contentview.backgroundColor = [UIColor redColor];
    contentview.backgroundColor = [UIColor colorWithRed:0.157 green:0.169 blue:0.208 alpha:1];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0 , 0, contentview.bounds.size.width, screen_height) style:(UITableViewStylePlain)];
    //
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    [contentview addSubview:_tableView];
    contentview.frame = CGRectMake(0, subviews_h, screen_width, _tableView.frame.origin.y+_tableView.frame.size.height);
    [self addSubview:contentview];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
      scrollView = rootview;
    CGFloat ff = scrollView.contentOffset.y;
    CGRect rect = headerimgview.frame;
    rect.origin.y = ff;
    rect.size.height = headerv_firstrect.size.height-ff;
    headerimgview.frame = rect;
    NSLog(@"滚动视图--%f",ff);
    NSLog(@"+++++++++%f",self.tableView.contentOffset.y);
    if (ff ==screen_width/2) {
        self.tableView.scrollEnabled = YES;
        CGFloat tmpf = scrollView.contentOffset.y/scrollView.bounds.size.height;
        CGFloat a = 1.34-tmpf;
        contentview.backgroundColor = [UIColor colorWithRed:0.157 green:0.169 blue:0.208 alpha:a];
    }else{

        self.tableView.scrollEnabled = NO;
    }
    
}
#pragma tableView 代理方法
//tab分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //分区个数
    return 1;
}
///tab个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}
//tab设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //cell 赋值
    
    cell.textLabel.text = [NSString stringWithFormat:@"----%ld 行",indexPath.row];
    // cell 其他配置
    
    
    /*
     //cell选中时的颜色 无色
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
     //cell 背景颜色
     cell.backgroundColor = [UIColor yellowColor];
     //分割线
     tableView.separatorStyle = UITableViewCellSelectionStyleNone;
     */
    return cell;
}
#pragma mark - Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - Cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
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
