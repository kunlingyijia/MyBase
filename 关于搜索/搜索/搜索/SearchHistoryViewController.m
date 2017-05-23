//
//  SearchHistoryViewController.m
//  搜索
//
//  Created by 席亚坤 on 16/12/23.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "SearchHistoryViewController.h"
#import "SearchHistoryCell.h"
#import "SearchHistoryCellTwo.h"

#import "TwoViewController.h"
#import "SearchHistoryView.h"


@interface SearchHistoryViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
typedef enum : NSUInteger {
    HistoryData,
    NetWorkData,
} SearchData;
@property(nonatomic,strong)SearchHistoryView *SHView;
///数据源类型
@property(nonatomic,assign)SearchData searchData;
///历史数据
@property (nonatomic,strong)NSMutableArray * HistoryArray;
///网络数据
@property (nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation SearchHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self SET_UI];
    [self SET_Data];


    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
     [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma mark - SET_Data
-(void)SET_Data{
    self.searchData = HistoryData;
    [self.HistoryArray removeAllObjects];
    self.HistoryArray = [NSMutableArray arrayWithArray:[self GetHistoryData]];
    [self.tableView reloadData];
    
}
-(id)instanceFromNib:(NSString*)nibName{
    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    
    return  [objects objectAtIndex:0];
}
#pragma mark -SET_HeaderAndFooter
-(void)SET_HeaderAndFooter{
    
   

#warning 这个需要在tableView的类拓展中-------
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    UIButton * FooterViewBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    FooterViewBtn.frame = CGRectMake(self.tableView.tableFooterView.frame.size.width/4, 10, self.tableView.tableFooterView.frame.size.width/2, 40) ;
    FooterViewBtn.layer.masksToBounds = YES;
    FooterViewBtn.layer.cornerRadius = 5;
    FooterViewBtn.layer.borderColor = [UIColor grayColor].CGColor;
    FooterViewBtn.layer.borderWidth = 1;
    
    [FooterViewBtn setTitle:@"清除历史" forState:(UIControlStateNormal)];
    [FooterViewBtn addTarget:self action:@selector(ClearhistoryAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [FooterViewBtn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
    
    [self.tableView.tableFooterView addSubview:FooterViewBtn];
    
    
   

    
}
#pragma mark - SET_UI
-(void)SET_UI{
    
    _bottomView.layer.masksToBounds = YES;
    _bottomView.layer.cornerRadius = 5;
    
//注册
    [self.tableView registerNib:[UINib nibWithNibName:@"SearchHistoryCell" bundle:nil] forCellReuseIdentifier:@"SearchHistoryCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SearchHistoryCellTwo" bundle:nil] forCellReuseIdentifier:@"SearchHistoryCellTwo"];
    self.tableView.tableFooterView = [UIView new];
    //输入框
    [self.searchHisToryTF becomeFirstResponder];
    [self.searchHisToryTF addTarget:self action:@selector(searchHisToryTFEditingChanged:) forControlEvents:(UIControlEventEditingChanged)];
    
}


#pragma tableView 代理方法
//tab分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //分区个数
    switch (self.searchData) {
        case HistoryData:
        {
            
            return 2;
        }
            break;
        case NetWorkData:
        {
            return 1;
            
        }
            break;
        default:{
            return 0;
        }
            break;
    }

}
///tab个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (self.searchData) {
        case HistoryData:
        {
            if (section==0) {
                return self.HistoryArray.count;
            }else{
                return self.HistoryArray.count !=0 ? 1:0;
            }
            
           
            
        }
            break;
        case NetWorkData:
        {
            return self.dataArray.count;

        }
            break;
        default:{
            return 0;
        }
            break;
    }

}
//tab设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
   
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    switch (self.searchData) {
        case HistoryData:
        {
            if (indexPath.section==0) {
                 SearchHistoryCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SearchHistoryCell" forIndexPath:indexPath];
                 cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.label.text = self.HistoryArray[indexPath.row];

                return cell;

            }else{
                SearchHistoryCellTwo * cell = [tableView dequeueReusableCellWithIdentifier:@"SearchHistoryCellTwo" forIndexPath:indexPath];
                [cell.ClearBtn addTarget:self action:@selector(ClearhistoryAction:) forControlEvents:(UIControlEventTouchUpInside)];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
              
                
                return cell;
            }
            
        }
            break;
        case NetWorkData:
        {
            SearchHistoryCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SearchHistoryCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = self.dataArray[indexPath.row];
            
            return cell;

        }
            break;
        default:{
        }
            break;
    }
    return nil;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (self.searchData) {
        case HistoryData:
        {
            if (indexPath.section==0) {
                return 44;
            }else{
                return 80;
            }
            
        }
            break;
        case NetWorkData:
        {
            return 44;
        }
            break;
        default:{
            return 44;

        }
            break;
    }

}

#pragma mark - Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (self.searchData) {
        case HistoryData:
        {   //第一分区
            if (indexPath.section==0) {
                
            }

        }
            break;
        case NetWorkData:
        {
            
        }
            break;
        default:{
        }
            break;
    }

}


#pragma mark - 返回事件
- (IBAction)CancelAction:(UIButton *)sender {
    [self.view endEditing:NO];
   
     [self.navigationController popViewControllerAnimated:NO];
}
#pragma mark - searchHisToryTFEditingChanged
-(void)searchHisToryTFEditingChanged:(UITextField*)sender{
    if ([sender.text isEqualToString:@""]) {
        self.searchData = HistoryData;
        [self.HistoryArray removeAllObjects];
        self.HistoryArray = [NSMutableArray arrayWithArray:[self GetHistoryData]];
        [self.tableView reloadData];
        
    }else{
         self.searchData = NetWorkData;
#warning 网络请求-----
         [self.tableView reloadData];

    }
    
}
#pragma mark - 清除输入框
- (IBAction)ClearTFAction:(UIButton *)sender {
    
    _searchHisToryTF.text = @"";
    [self.dataArray removeAllObjects];
    self.searchData = HistoryData;
    self.HistoryArray = [NSMutableArray arrayWithArray:[self GetHistoryData]];
    [self.tableView reloadData];
    
    
    
}
#pragma mark - 列表滚动键盘回收
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_searchHisToryTF resignFirstResponder];
}
#pragma mark - 点击键盘return键
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    if (textField.text.length !=0) {
        //保存历史记录
        [self  HistoryDataSave];
    }
    #warning 添加网络搜索------
    self.searchData = NetWorkData ;
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
    return YES;
 
   

}

#pragma mark - 清除历史
-(void)ClearhistoryAction:(UIButton*)sender
{    [self.view endEditing:YES];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"SearchHistory"];
    [self.HistoryArray removeAllObjects];
    [self.dataArray removeAllObjects];
    self.searchData = NetWorkData;
    [self.tableView reloadData];

    
}


#pragma mark - 保存历史记录
-(void)HistoryDataSave
{
    NSUserDefaults * UserDefault = [NSUserDefaults standardUserDefaults];
    NSArray * SearchArr = [UserDefault objectForKey:@"SearchHistory"];
    if (SearchArr.count==0) {
     [UserDefault setObject: [NSArray arrayWithObjects:@"历史记录",self.searchHisToryTF.text,nil] forKey:@"SearchHistory"];
    }else{
        NSMutableArray * AfterMArray = [NSMutableArray arrayWithArray:SearchArr];
        //插入数据到第二位
        [AfterMArray insertObject:self.searchHisToryTF.text atIndex:1];
        //去重
        NSMutableArray *listAry = [[NSMutableArray alloc]init];
        for (NSString *str in AfterMArray) {
            if (![listAry containsObject:str]) {
                [listAry addObject:str];
            }
        }
        [UserDefault setObject:[NSArray arrayWithArray:listAry] forKey:@"SearchHistory"];
    }
    [UserDefault synchronize];
   

    
}
#pragma mark - 取出历史记录
-(NSArray*)GetHistoryData{
     return [[NSUserDefaults standardUserDefaults] objectForKey:@"SearchHistory"];
}

-(NSMutableArray *)HistoryArray{
    if (!_HistoryArray) {
        self.HistoryArray = [NSMutableArray arrayWithCapacity:1];
    }return _HistoryArray;
}
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray arrayWithCapacity:1];
    }return _dataArray;
}

#pragma mark - dealloc
- (void)dealloc
{
    NSLog(@"%@销毁了", [self class]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
