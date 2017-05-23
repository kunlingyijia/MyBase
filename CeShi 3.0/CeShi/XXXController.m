//
//  XXXController.m
//  CeShi
//
//  Created by 席亚坤 on 16/9/11.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "XXXController.h"
#define _KeyDic @"_key":@"e81952aed93e9bac3d46069458cefa0e"
#import "NetManager.h"
#import "model.h"
#import "GoodListCell.h"
#import "UIImageView+WebCache.h"
@interface XXXController ()
@property(nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation XXXController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //用storyboard 进行自适应布局
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.dataArray = [NSMutableArray arrayWithCapacity:1];
    NSDictionary *dic = @{_KeyDic,@"is_real":@"1"};
    [NetManager getRequestwithURL:@"http://app.yaojinshu.cn/goods/list" withparameters:dic withSuccessResult:^(id successResult) {
        //NSLog(@"%@",successResult);
        [self passDataWithNSData:successResult];
        [self.tableView reloadData];
    } withErrorResult:^(NSError *errorResult) {
        NSLog(@"%@",errorResult);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//解析数据
-(void)passDataWithNSData:(NSDictionary *)data{
    NSDictionary *datadic = data[@"data"];
    NSMutableArray * ListArray = datadic[@"list"];
    NSLog(@"%@",ListArray);
    for (NSDictionary *dic in ListArray) {
        model *mo = [[model alloc]init];
        [mo setValuesForKeysWithDictionary:dic];
        //添加到数组
        [self.dataArray addObject:mo];
    }
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GoodListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodCell" forIndexPath:indexPath];
    
    // Configure the cell...
    model *mo = self.dataArray[indexPath.row];
    [cell.goods_thumb sd_setImageWithURL:[NSURL URLWithString:mo.goods_thumb]];
    
    cell.market_price.text = mo.market_price;
    cell.goods_name.text = mo.goods_name;
    
    cell.backgroundColor= [UIColor colorWithRed:233.0 green:90.0 blue:50 alpha:1.0];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
