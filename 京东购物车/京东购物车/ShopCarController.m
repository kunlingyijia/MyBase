//
//  ShopCarController.m
//  京东购物车
//
//  Created by 席亚坤 on 16/11/21.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ShopCarController.h"
#import "ShopEditViewController.h"

#import "ShopCaCell.h"
#import "HeaderCarView.h"
#import "PublicTF.h"
#import "PublicBtn.h"

#import "YYModel.h"

#import "HeaderModel.h"
#import "CarModel.h"
#import "AppDelegate.h"
@interface ShopCarController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
///数据
@property (nonatomic,strong)NSMutableArray * dataArray;
///全选数据
//@property (nonatomic,strong)NSMutableArray *  chooseDataArray;
///全选set
@property(nonatomic,strong)NSMutableSet *chooseAllSet;
///
///选择
@property (nonatomic,strong)NSMutableArray * choseArr;
@end

@implementation ShopCarController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }return _dataArray;
}
//-(NSMutableArray *)chooseDataArray{
//    if (!_chooseDataArray) {
//        self.chooseDataArray = [NSMutableArray arrayWithCapacity:1];
//    }return _chooseDataArray;
//}
-(NSMutableSet *)chooseAllSet{
    if (!_chooseAllSet) {
        self.chooseAllSet = [NSMutableSet setWithCapacity:0];
    }return _chooseAllSet;
}
-(NSMutableArray *)choseArr{
    if (!_choseArr) {
        self.choseArr = [NSMutableArray arrayWithCapacity:1];
    }return _choseArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"购物车";
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItem:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.tableView.tableFooterView =[[UIView alloc]init];
    [self.tableView registerNib:[UINib nibWithNibName:@"ShopCaCell" bundle:nil] forCellReuseIdentifier:@"ShopCaCell"];
    [self.tableView registerClass:[HeaderCarView class] forHeaderFooterViewReuseIdentifier:@"HeaderCarView"];
    self.tableView.rowHeight = 120;
    NSString *file = [[NSBundle mainBundle] pathForResource:@"ShopCar" ofType:@"plist"];
    NSMutableDictionary *JD = [[NSMutableDictionary alloc] initWithContentsOfFile:file];  ;
     NSMutableArray * Mainarr = JD[@"JD"];
//    NSLog(@"%@",Mainarr);
    for (NSMutableDictionary * MainDic in Mainarr) {
        HeaderModel * headerModel = [HeaderModel yy_modelWithJSON:MainDic];
        NSMutableArray * CarArray = MainDic[@"array"];
        NSMutableArray * array = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary * CarDic in CarArray) {
            CarModel  * carModel = [CarModel yy_modelWithDictionary:CarDic];
            [array addObject:carModel];
            if ([carModel.chose isEqualToString:@"1"]) {
                NSString * allPrice = [NSString stringWithFormat:@"%f",[carModel.price floatValue]*[carModel.shu floatValue]];
                //被选中的数据
                [self.choseArr addObject:allPrice];
            }
        

      }
        headerModel.array = array;
        [self.dataArray addObject:headerModel];
    }
    
    NSNumber *sum = [self.choseArr valueForKeyPath:@"@sum.floatValue"];
    self.totalLabel.text = [NSString stringWithFormat:@"%@",sum];
    

 
    
}

-(void)rightBarButtonItem:(UIBarButtonItem*)sender{
    //Push 跳转
    ShopEditViewController * VC = [[ShopEditViewController alloc]initWithNibName:@"ShopEditViewController" bundle:nil];
    VC.MaindataArray = self.dataArray;
    NSLog(@"%@",self.dataArray);
    [self.navigationController  pushViewController:VC animated:NO];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
}
#pragma tableView 代理方法
//tab分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //分区个数
    return self.dataArray.count;

}
///tab个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    HeaderModel *headerM=self.dataArray[section];
    return ((NSMutableArray*)headerM.array).count;
}
//tab设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShopCaCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCaCell" forIndexPath:indexPath];
    //cell 赋值
    cell.addBtn.indexPathBtn = indexPath;
    [cell.addBtn addTarget:self action: @selector(addBtnAction:)  forControlEvents:(UIControlEventTouchUpInside)];
     cell.deleteBtn.indexPathBtn = indexPath;
    [cell.deleteBtn addTarget:self action: @selector(addBtnAction:)  forControlEvents:(UIControlEventTouchUpInside)];
    cell.textTf.indexPathBtn = indexPath;
    [cell.textTf addTarget:self action:@selector(celltextTf:) forControlEvents:UIControlEventEditingDidEnd];
    cell.choseBtn.indexPathBtn = indexPath;
    [cell.choseBtn addTarget:self action:@selector(cellchoseBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    HeaderModel *headerM=self.dataArray[indexPath.section];
    NSMutableArray * arr= (NSMutableArray *)headerM.array;
    CarModel * car = arr[indexPath.row];
    [cell cellGetData:car];
    
        return cell;
}
#pragma mark - Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - celltextTf
-(void)celltextTf:(PublicTF*)sender{
    if (sender.text.length<1||[sender.text isEqualToString:@"0"]) {
        NSLog(@"提示");
        
    }  else{  ShopCaCell *cell = [self.tableView cellForRowAtIndexPath:sender.indexPathBtn];
    HeaderModel *headerM=self.dataArray[sender.indexPathBtn.section];
    NSMutableArray * JDArray= (NSMutableArray *)headerM.array;
    CarModel * car = JDArray[sender.indexPathBtn.row];
    [cell.choseBtn setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:UIControlStateNormal];
    NSString * chose = @"1";
    car.chose = @"1";
    car.shu =[NSString stringWithFormat:@"%@", cell.textTf.text];
    //[(NSMutableArray *)headerM.array replaceObjectAtIndex:sender.indexPathBtn.row withObject:car];
    NSMutableArray *YesOrNo = [NSMutableArray arrayWithCapacity:0];
    for (CarModel * carmodel in headerM.array ) {
        NSString  *cho =[NSString stringWithFormat:@"%@",carmodel.chose];
        [YesOrNo addObject:cho];
    }
    NSSet  * set =[NSSet setWithArray:YesOrNo];
    if (set.count == 1) {
        headerM.Dimage = [NSString stringWithFormat:@"%@", chose];
        
    }
    
    //[self.dataArray replaceObjectAtIndex:sender.indexPathBtn.section withObject:headerM];
    ///改变全选按钮状态
    [self ChangeAllSelection];
    //[self.tableView reloadData];
    }
    
}
#pragma mark - addBtnAction 
-(void)addBtnAction:(PublicBtn*)sender{
    ShopCaCell *cell = [self.tableView cellForRowAtIndexPath:sender.indexPathBtn];
    HeaderModel *headerM=self.dataArray[sender.indexPathBtn.section];
    NSMutableArray * JDArray= (NSMutableArray *)headerM.array;
    CarModel * car = JDArray[sender.indexPathBtn.row];
    [cell.choseBtn setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:UIControlStateNormal];
    NSString * chose = @"1";
    car.chose = @"1";
    car.shu =[NSString stringWithFormat:@"%@", cell.textTf.text];
    //[(NSMutableArray *)headerM.array replaceObjectAtIndex:sender.indexPathBtn.row withObject:car];
    NSMutableArray *YesOrNo = [NSMutableArray arrayWithCapacity:0];
    for (CarModel * carmodel in headerM.array ) {
        NSString  *cho =[NSString stringWithFormat:@"%@",carmodel.chose];
        [YesOrNo addObject:cho];
    }
    NSSet  * set =[NSSet setWithArray:YesOrNo];
    if (set.count == 1) {
        headerM.Dimage = [NSString stringWithFormat:@"%@", chose];
        
    }
    
    //[self.dataArray replaceObjectAtIndex:sender.indexPathBtn.section withObject:headerM];
    ///改变全选按钮状态
    [self ChangeAllSelection];
    [self.tableView reloadData];
}
#pragma mark - cellchoseBtn
-(void)cellchoseBtn:(PublicBtn*)sender{
    HeaderModel *headerM=self.dataArray[sender.indexPathBtn.section];
    NSMutableArray * JDArray= (NSMutableArray *)headerM.array;
    CarModel * car = JDArray[sender.indexPathBtn.row];
    if ([car.chose isEqualToString:@"1"]) {
         car.chose = @"0";
        [sender setImage:[UIImage imageNamed:@"购物车-未选中"] forState:UIControlStateNormal];
    }else{
        car.chose = @"1";
        [sender setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:UIControlStateNormal];
    }
   // [(NSMutableArray*)headerM.array replaceObjectAtIndex:sender.indexPathBtn.row withObject:car];
    NSMutableArray *YesOrNo = [NSMutableArray arrayWithCapacity:0];
    for (CarModel * carmodel in headerM.array ) {
        NSString  *cho =[NSString stringWithFormat:@"%@",carmodel.chose];
        [YesOrNo addObject:cho];
    }
    NSSet  * set =[NSSet setWithArray:YesOrNo];
    if (set.count == 1) {
        headerM.Dimage = [NSString stringWithFormat:@"%@", car.chose];
    }else{
        headerM.Dimage = [NSString stringWithFormat:@"0"];
    }
    //[self.dataArray replaceObjectAtIndex:sender.indexPathBtn.section withObject:headerM];
    ///改变全选按钮状态
    [self ChangeAllSelection];
    [self.tableView reloadData];
    
 
}
#pragma mark - 分区页眉
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderCarView * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderCarView" ];
    header.oneBtn.indexPathBtn = [NSIndexPath indexPathWithIndex:section];
    [header.oneBtn addTarget:self action:@selector(headeroneBtn:) forControlEvents:(UIControlEventTouchUpInside)];
   HeaderModel *headerM = self.dataArray[section];
    if ([headerM.Dimage isEqualToString:@"1"]) {
        [header.oneBtn setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:(UIControlStateNormal)];
    }else{
        [header.oneBtn setImage:[UIImage imageNamed:@"购物车-未选中"] forState:(UIControlStateNormal)];
    }
    return header;

}


#pragma mark - 分区页眉 勾选时间
-(void)headeroneBtn:(PublicBtn*)sender{
   HeaderModel *headerM =self.dataArray[sender.indexPathBtn.section];
    NSMutableArray * arr = (NSMutableArray *)headerM.array;
    if ([headerM.Dimage isEqualToString:@"1"]) {
            headerM.Dimage = @"0";
         for (int i=0; i<arr.count; i++) {
            CarModel *carModel =headerM.array[i];
            carModel.chose = [NSString stringWithFormat:@"0"];
           // [(NSMutableArray *)headerM.array  replaceObjectAtIndex:i withObject:carModel];
        }
        [sender setImage:[UIImage imageNamed:@"购物车-未选中"] forState:(UIControlStateNormal)];
    }else{
        headerM.Dimage = @"1";
        for (int i=0; i<arr.count; i++) {
            CarModel *carModel =headerM.array[i];
            carModel.chose = [NSString stringWithFormat:@"1"];
           // [(NSMutableArray *)headerM.array  replaceObjectAtIndex:i withObject:carModel];
        }
        [sender setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:(UIControlStateNormal)];

    }
    //[self.dataArray replaceObjectAtIndex:sender.indexPathBtn.section withObject:headerM];
    ///改变全选按钮状态
     [self ChangeAllSelection];
     [self.tableView reloadData];
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//iOS 8.0 后才有的方法
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    UITableViewRowAction *shanchu = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleDefault) title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        HeaderModel * headerM =weakSelf.dataArray[indexPath.section];
       
        NSMutableArray * arr = ( NSMutableArray *)headerM.array;
               [arr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        if (arr.count==0) {
         [weakSelf.dataArray removeObjectAtIndex:indexPath.section];
        }
        [weakSelf ChangeAllSelection];
        [weakSelf.tableView reloadData];
        NSLog(@"%@",weakSelf.dataArray);

    }];
    return @[shanchu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 全选点击事件
- (IBAction)choseAllAction:(UIButton *)sender {
    NSMutableArray *DimageArray = [NSMutableArray arrayWithCapacity:0];
    for (HeaderModel *headerMin in self.dataArray ) {
        [DimageArray addObject: headerMin.Dimage];
    }
    NSSet * set = [NSSet setWithArray:DimageArray];
    for (NSString *str in set) {
        if ([str isEqualToString:@"1"]) {
            for (int i = 0; i<self.dataArray.count; i++) {
                HeaderModel * heade = self.dataArray[i];
                for (int i=0; i<heade.array.count; i++) {
                    CarModel *car = heade.array[i];
                    car.chose = @"0";
                    [(NSMutableArray*)heade.array replaceObjectAtIndex:i withObject:car];
                }
                heade.Dimage = @"0" ;
            }
        }else{
            for (int i = 0; i<self.dataArray.count; i++) {
                HeaderModel * heade = self.dataArray[i];
                for (int i=0; i<heade.array.count; i++) {
                    CarModel *car = heade.array[i];
                    car.chose = @"1";
                    [(NSMutableArray*)heade.array replaceObjectAtIndex:i withObject:car];
                }
                heade.Dimage = @"1" ;
            }
        }
    }
    [self ChangeAllSelection];
    [self.tableView reloadData];

    
}
#pragma mark - 支付 点击事件
- (IBAction)payAction:(UIButton *)sender {
    
    NSLog(@"%@",self.choseArr);
}
#pragma mark -   ///改变全选按钮状态
-(void)ChangeAllSelection{
    [self.choseArr removeAllObjects];
    NSMutableArray *DimageArray11 = [NSMutableArray arrayWithCapacity:0];
    for (HeaderModel *headerMin11 in self.dataArray ) {
        [DimageArray11 addObject: headerMin11.Dimage];
        for (CarModel * carmodel in headerMin11.array) {
            if ([carmodel.chose isEqualToString:@"1"]) {
                NSString * allPrice = [NSString stringWithFormat:@"%f",[carmodel.price floatValue]*[carmodel.shu floatValue]];
                //被选中的数据
                [self.choseArr addObject:allPrice];
            }
            

        }
       
    }
    [self.chooseAllSet removeAllObjects];
    self.chooseAllSet = [NSMutableSet setWithArray:DimageArray11];
    if ( self.chooseAllSet.count == 1) {
        for (NSString *setStr in self.chooseAllSet) {
            if ([setStr isEqualToString:@"1"]) {
                [self.choseAllBtn setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:(UIControlStateNormal)];
            }else{
                [self.choseAllBtn setImage:[UIImage imageNamed:@"购物车-未选中"] forState:(UIControlStateNormal)];
            }
        }
    }else{
        [self.choseAllBtn setImage:[UIImage imageNamed:@"购物车-未选中"] forState:(UIControlStateNormal)];
        
    }
    //总价格
    NSNumber *sum = [self.choseArr valueForKeyPath:@"@sum.floatValue"];
    self.totalLabel.text = [NSString stringWithFormat:@"%@",sum];
    NSLog(@"价格综合--%@",sum);
    
}

@end
