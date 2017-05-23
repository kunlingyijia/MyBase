//
//  ShopEditViewController.m
//  京东购物车
//
//  Created by 席亚坤 on 16/12/21.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ShopEditViewController.h"

#import "ShopCaCell.h"
#import "HeaderCarView.h"
#import "PublicTF.h"
#import "PublicBtn.h"
@interface ShopEditViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
///数据
///数据
@property (nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation ShopEditViewController

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
 
    
    for (NSMutableDictionary * MainDic in self.MaindataArray) {
        NSMutableArray * array = MainDic[@"array"];
        for (int i=0; i<array.count; i++) {
            [array replaceObjectAtIndex:i withObject:[@{@"shu":@"13",@"chose":@"0"}mutableCopy]];
        }
        [MainDic setObject:@"0" forKey:@"Dimage"];
        [MainDic setObject:array forKey:@"array"];
        [self.dataArray addObject:MainDic];
    
    }
    
     NSLog(@"-----------%@", self.dataArray);
    self.tableView.tableFooterView =[[UIView alloc]init];
    [self.tableView registerNib:[UINib nibWithNibName:@"ShopCaCell" bundle:nil] forCellReuseIdentifier:@"ShopCaCell"];
    [self.tableView registerClass:[HeaderCarView class] forHeaderFooterViewReuseIdentifier:@"HeaderCarView"];
    self.tableView.rowHeight = 120;
    [self.tableView reloadData];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItem:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)rightBarButtonItem:(UIBarButtonItem*)sender{
    [self.navigationController popViewControllerAnimated:NO];
    
    
}
#pragma tableView 代理方法
//tab分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //分区个数
    return self.dataArray.count;
    
}
///tab个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableDictionary *dic =self.dataArray[section];
    NSMutableArray *arr = dic[@"array"];
    return arr.count;
}
//tab设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShopCaCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCaCell" forIndexPath:indexPath];
    
    //cell 赋值
    cell.addBtn.indexPathBtn = indexPath;
    [cell.addBtn addTarget:self action: @selector(addBtnAction:)  forControlEvents:(UIControlEventTouchUpInside)];
    cell.deleteBtn.indexPathBtn = indexPath;
    [cell.deleteBtn addTarget:self action: @selector(deleteBtnAction:)  forControlEvents:(UIControlEventTouchUpInside)];
    cell.textTf.indexPathBtn = indexPath;
    cell.choseBtn.indexPathBtn = indexPath;
    [cell.choseBtn addTarget:self action:@selector(cellchoseBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    NSMutableDictionary *Maindic =self.dataArray[indexPath.section];
    NSMutableArray * arr = Maindic[@"array"];
    NSMutableDictionary * dic =arr [indexPath.row];
    if ([dic[@"chose"] isEqualToString:@"1"]) {
        [cell.choseBtn setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:(UIControlStateNormal)];
    }else{
        [cell.choseBtn setImage:[UIImage imageNamed:@"购物车-未选中"] forState:(UIControlStateNormal)];
    }
    
    cell.textTf.text =[NSString stringWithFormat:@"%@",dic[@"shu"]];
    if ([cell.textTf.text isEqualToString:@"1"]) {
        cell.deleteBtn.userInteractionEnabled =  NO;
    }else{
        cell.deleteBtn.userInteractionEnabled = YES;
    }
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
#pragma mark - addBtnAction
-(void)addBtnAction:(PublicBtn*)sender{
    NSMutableDictionary *Maindic =self.dataArray[sender.indexPathBtn.section];
    NSMutableArray * arr = Maindic[@"array"];
    NSMutableDictionary * Mdic = arr[sender.indexPathBtn.row];
    ShopCaCell *cell = [self.tableView cellForRowAtIndexPath:sender.indexPathBtn];
    [cell.choseBtn setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:UIControlStateNormal];
    NSLog(@"%@",Mdic);
    NSString * chose = @"1";
    Mdic =[@{@"shu":cell.textTf.text,@"chose":chose}mutableCopy];
    [arr replaceObjectAtIndex:sender.indexPathBtn.row withObject:Mdic];
    NSMutableArray *YesOrNo = [NSMutableArray arrayWithCapacity:0];
    for ( NSMutableDictionary * dic in arr) {
        
        [YesOrNo addObject:dic[@"chose"]];
    }
    NSSet  * set =[NSSet setWithArray:YesOrNo];
    
    if (set.count == 1) {
        [Maindic setObject:chose forKey:@"Dimage"];
    }
    [Maindic setObject:arr forKey:@"array"];
    [self.dataArray replaceObjectAtIndex:sender.indexPathBtn.section withObject:Maindic];
    [self.tableView reloadData];
}
#pragma mark - deleteBtnAction
-(void)deleteBtnAction:(PublicBtn*)sender{
    
    NSMutableDictionary *Maindic =self.dataArray[sender.indexPathBtn.section];
    NSMutableArray * arr = Maindic[@"array"];
    NSMutableDictionary * Mdic = arr[sender.indexPathBtn.row];
    ShopCaCell *cell = [self.tableView cellForRowAtIndexPath:sender.indexPathBtn];
    [cell.choseBtn setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:UIControlStateNormal];
    NSLog(@"%@",Mdic);
    NSString * chose = @"1";
    Mdic =[@{@"shu":cell.textTf.text,@"chose":chose}mutableCopy];
    [arr replaceObjectAtIndex:sender.indexPathBtn.row withObject:Mdic];
    NSMutableArray *YesOrNo = [NSMutableArray arrayWithCapacity:0];
    for ( NSMutableDictionary * dic in arr) {
        
        [YesOrNo addObject:dic[@"chose"]];
    }
    NSSet  * set =[NSSet setWithArray:YesOrNo];
    
    if (set.count == 1) {
        [Maindic setObject:chose forKey:@"Dimage"];
    }
    
    [Maindic setObject:arr forKey:@"array"];
    [self.dataArray replaceObjectAtIndex:sender.indexPathBtn.section withObject:Maindic];
    [self.tableView reloadData];
    
}
#pragma mark - cellchoseBtn
-(void)cellchoseBtn:(PublicBtn*)sender{
    ShopCaCell *cell = [self.tableView cellForRowAtIndexPath:sender.indexPathBtn];
    NSMutableDictionary *Maindic =self.dataArray[sender.indexPathBtn.section];
    NSMutableArray * arr = Maindic[@"array"];
    NSMutableDictionary * Mdic = arr[sender.indexPathBtn.row];
    NSString * chose = Mdic[@"chose"];
    if ([chose isEqualToString:@"1"]) {
        chose = @"0";
        Mdic =[@{@"shu":cell.textTf.text,@"chose":chose}mutableCopy];
        [sender setImage:[UIImage imageNamed:@"购物车-未选中"] forState:UIControlStateNormal];
    }else{
        chose = @"1";
        Mdic =[@{@"shu":cell.textTf.text,@"chose":chose}mutableCopy];
        [sender setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:UIControlStateNormal];
    }
    [arr replaceObjectAtIndex:sender.indexPathBtn.row withObject:Mdic];
    NSMutableArray *YesOrNo = [NSMutableArray arrayWithCapacity:0];
    for ( NSMutableDictionary * dic in arr) {
        
        [YesOrNo addObject:dic[@"chose"]];
    }
    NSSet  * set =[NSSet setWithArray:YesOrNo];
    
    if (set.count == 1) {
        [Maindic setObject:chose forKey:@"Dimage"];
    }
    [Maindic setObject:arr forKey:@"array"];
    [self.dataArray replaceObjectAtIndex:sender.indexPathBtn.section withObject:Maindic];
    [self.tableView reloadData];
    
}
#pragma mark - 分区页眉
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderCarView * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderCarView" ];
    header.userInteractionEnabled = YES;
    header.backgroundView.backgroundColor = [UIColor whiteColor];
    header.oneBtn.indexPathBtn = [NSIndexPath indexPathWithIndex:section];
    [header.oneBtn addTarget:self action:@selector(headeroneBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    
    NSMutableDictionary  *dic = self.dataArray[section];
    if ([dic[@"Dimage"] isEqualToString:@"1"]) {
        [header.oneBtn setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:(UIControlStateNormal)];
    }else{
        [header.oneBtn setImage:[UIImage imageNamed:@"购物车-未选中"] forState:(UIControlStateNormal)];
    }
    return header;
    
    
    
}


#pragma mark - 分区页眉 勾选时间
-(void)headeroneBtn:(PublicBtn*)sender{
    NSMutableDictionary *Maindic =self.dataArray[sender.indexPathBtn.section];
    NSString * Dimage = Maindic[@"Dimage"];
    NSMutableArray * arr = Maindic[@"array"];
    NSLog(@"arr--%@",arr);
    if ([Dimage isEqualToString:@"1"]) {
        Dimage = @"0";
        for (int i=0; i<arr.count; i++) {
            [arr replaceObjectAtIndex:i withObject:[@{@"shu":@"10",@"chose":@"0"}mutableCopy]];
        }
        [sender setImage:[UIImage imageNamed:@"购物车-未选中"] forState:(UIControlStateNormal)];
    }else{
        Dimage = @"1";
        for (int i=0; i<arr.count; i++) {
            [arr replaceObjectAtIndex:i withObject:[@{@"shu":@"10",@"chose":@"1"}mutableCopy]];
        }
        [sender setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:(UIControlStateNormal)];
        NSLog(@"arr++++++%@",arr);
        
    }
    [Maindic setObject:arr forKey:@"array"];
    [Maindic setObject:Dimage forKey:@"Dimage"];
    [self.dataArray replaceObjectAtIndex:sender.indexPathBtn.section withObject:Maindic];
    [self.tableView reloadData];
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//iOS 8.0 后才有的方法
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;

    UITableViewRowAction *shanchu = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleDefault) title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
        NSMutableDictionary *Maindic =weakSelf.dataArray[indexPath.section];
        NSMutableArray * arr = Maindic[@"array"];
        [arr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        if (arr.count==0) {
            [weakSelf.dataArray removeObjectAtIndex:indexPath.section];
        }
        
        [weakSelf.tableView reloadData];
      //  NSLog(@"%@",weakSelf.dataArray);
        
    }];
    UITableViewRowAction * biaoqian = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleNormal) title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"置顶");
        //插入
        //  [self.dataArray insertObject:_dataArray[indexPath.row] atIndex:0];
        //删除
        //[self.dataArray removeObjectAtIndex:indexPath.row+1];
        //刷新
        [weakSelf.tableView reloadData];
        
    }];
    return @[shanchu];
}
- (IBAction)selectAllAction:(UIButton *)sender {
    [self.dataArray removeAllObjects];
    NSMutableArray *DimageArray = [NSMutableArray arrayWithCapacity:0];
     for (NSMutableDictionary * MainDic in self.MaindataArray) {
         [DimageArray addObject:MainDic[@"Dimage"]];
     }
    NSSet * set = [NSSet setWithArray:DimageArray];
    for (NSString *str in set) {
        if ([str isEqualToString:@"1"]) {
            for (NSMutableDictionary * MainDic in self.MaindataArray) {
                NSMutableArray * array = MainDic[@"array"];
                for (int i=0; i<array.count; i++) {
                    [array replaceObjectAtIndex:i withObject:[@{@"shu":@"13",@"chose":@"0"}mutableCopy]];
                }
                [MainDic setObject:@"0" forKey:@"Dimage"];
                [MainDic setObject:array forKey:@"array"];
                [self.dataArray addObject:MainDic];
                
            }

        }else{
            for (NSMutableDictionary * MainDic in self.MaindataArray) {
                NSMutableArray * array = MainDic[@"array"];
                for (int i=0; i<array.count; i++) {
                    [array replaceObjectAtIndex:i withObject:[@{@"shu":@"13",@"chose":@"1"}mutableCopy]];
                }
                [MainDic setObject:@"1" forKey:@"Dimage"];
                [MainDic setObject:array forKey:@"array"];
                [self.dataArray addObject:MainDic];
                
            }

        }
    }
    [self.tableView reloadData];
    
}

-(void)dealloc{
 NSLog(@"%@销毁了",   [self class]);
}
@end
