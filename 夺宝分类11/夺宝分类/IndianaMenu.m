//
//  IndianaMenu.m
//  夺宝分类
//
//  Created by 席亚坤 on 17/4/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "IndianaMenu.h"
#import "IMenuTabOneCell.h"
#import "IMenuTabTwoCell.h"
#import "IMenuTabThreeCell.h"
#define IMenuWidth [UIScreen mainScreen].bounds.size.width
@interface IndianaMenu (){
    UITableView * MenuTableView;
    int x;
    int y;
    BOOL ISClass;
    NSMutableArray *ClassArr;

}

@property(nonatomic,strong)NSString *IsOpen;

@end
@implementation IndianaMenu



- (instancetype)initWithFrame:(CGRect)frame IsClass:(BOOL)iSClass ClassArr:(NSMutableArray*)arr{
    self = [super initWithFrame:frame];
    if (self) {
        ClassArr = [NSMutableArray arrayWithCapacity:0];
        x = frame.origin.x;
        y =frame.origin.y;
        ISClass = iSClass;
        ClassArr = arr;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        self.scrollEnabled = NO;
        [self addSubviews];
        
        
    }
    return self;
}


-(void)addSubviews{
    self.IsOpen =@"0";
    self.tableFooterView = [UIView new];
    self.dataSource = self;
    self.delegate = self;
    [self registerNib:[UINib nibWithNibName:@"IMenuTabOneCell" bundle:nil] forCellReuseIdentifier:@"IMenuTabOneCell"];
    [self registerNib:[UINib nibWithNibName:@"IMenuTabTwoCell" bundle:nil] forCellReuseIdentifier:@"IMenuTabTwoCell"];
    [self registerNib:[UINib nibWithNibName:@"IMenuTabThreeCell" bundle:nil] forCellReuseIdentifier:@"IMenuTabThreeCell"];
}

#pragma tableView 代理方法
//tab分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //分区个数
    return 1;
}
///tab个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
//tab设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        if (ISClass ==YES) {
            
            IMenuTabOneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"IMenuTabOneCell" forIndexPath:indexPath];
                    __weak typeof(self) weakSelf = self;
                    cell.IMenuTabOneCellBlock =^(NSInteger tag,NSString * IsOpen,NSString * IsUp){
                        weakSelf.IsOpen = IsOpen;
                        if (tag ==0&&[IsOpen isEqualToString:@"1"]) {
                            [weakSelf TableViewIsOpen:YES];
                        }else{
            
                            [weakSelf TableViewIsOpen:NO];
            
                        }
                        weakSelf. IndianaMenuBlock(tag,IsUp);
                        
                    };
             return cell;
        }else{
        IMenuTabThreeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"IMenuTabThreeCell" forIndexPath:indexPath];
                __weak typeof(self) weakSelf = self;
                cell.IMenuTabThreeCellBlock =^(NSInteger tag,NSString * IsOpen,NSString * IsUp){
                    weakSelf.IsOpen = IsOpen;
        
                    if (tag ==0&&[IsOpen isEqualToString:@"1"]) {
        
                        [weakSelf TableViewIsOpen:YES];
            
                    }else{
        
                        [weakSelf TableViewIsOpen:NO];
        
                    }
                     weakSelf.IndianaMenuBlock(tag,IsUp);
                };

        
        
        
        return cell;
            
        }
    }else{
        IMenuTabTwoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"IMenuTabTwoCell" forIndexPath:indexPath];
        __weak typeof(self) weakSelf = self;
        [cell CellGetData:ClassArr];
        cell.IMenuTabTwoCellBlock =^(NSInteger tag){
            IMenuTabOneCell * cell = [self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0 ]];
            cell.IsOpen =@"0";
            weakSelf.IndianaClassMenuBlock(tag);
            [weakSelf reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:(UITableViewRowAnimationNone)];
            [weakSelf TableViewIsOpen:NO];
        };
        return cell;


        
    }
    
}
#pragma mark - Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
       
    }else{
       
        IMenuTabOneCell * cell = [self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0 ]];
        cell.IsOpen =@"0";
        [self reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:(UITableViewRowAnimationNone)];
        [self TableViewIsOpen:NO];

    }
    
}
#pragma mark - Cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row ==0) {
        return IMenuWidth*0.12;
    }else{
        return self.bounds.size.height-IMenuWidth*0.12;
        
    }
    
    
}


-(void)TableViewIsOpen:(BOOL)Y{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(x, y, [UIScreen mainScreen].bounds.size.width,Y==YES ? [UIScreen mainScreen].bounds.size.height:IMenuWidth*0.12);
        [self layoutIfNeeded];
    }];
    
}






@end
