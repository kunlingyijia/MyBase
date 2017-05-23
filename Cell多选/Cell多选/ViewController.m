//
//  ViewController.m
//  Cell多选
//
//  Created by 席亚坤 on 17/3/26.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "Model.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
///数据
@property (nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UI
    [self SET_UI];
    //数据
    [self  SET_DATA];
    
}
#pragma mark - 关于UI
-(void)SET_UI{
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
    
}
#pragma mark - 关于数据
-(void)SET_DATA{
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i <10; i++) {
        Model * model = [Model new];
        model.selectedType =NO;
        [self.dataArray addObject:model];
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
    
    return self.dataArray.count;
}
//tab设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    
    //cell 赋值
    cell.model = indexPath.row>=self.dataArray.count ? nil :self.dataArray[indexPath.row];
    
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
    Model * model = indexPath.row>= self.dataArray.count ? nil :self.dataArray[indexPath.row];
    if (model.selectedType) {
        model.selectedType =NO;
    }else{
        model.selectedType = YES;
    }
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationFade)];
}
#pragma mark - Cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
