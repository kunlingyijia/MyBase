//
//  NewsController.m
//  CeShi
//
//  Created by 席亚坤 on 16/9/11.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "NewsController.h"
#define _KeyDic @"_key":@"e81952aed93e9bac3d46069458cefa0e"
#import "NetManager.h"
#import "model.h"
#import "NewListCell.h"
#import "UIImageView+WebCache.h"
@interface NewsController ()
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation NewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    //用storyboard 进行自适应布局
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    self.dataArray = [NSMutableArray arrayWithCapacity:1];
    NSDictionary *dic = @{_KeyDic};
    [NetManager getRequestwithURL:@"http://app.yaojinshu.cn/article/list" withparameters:dic withSuccessResult:^(id successResult) {
        //NSLog(@"%@",successResult);
        [self passDataWithNSData:successResult];
        [self.tableView reloadData];
    } withErrorResult:^(NSError *errorResult) {
        NSLog(@"%@",errorResult);
    }];
    
}

//解析数据
-(void)passDataWithNSData:(NSDictionary *)data{
    NSDictionary *dataDic= data[@"data"];
    NSMutableArray * ListArray = dataDic[@"list"];
     NSLog(@"%@",ListArray);
    for (NSDictionary *dic in ListArray) {
        model *mo = [[model alloc]init];
        [mo setValuesForKeysWithDictionary:dic];
        //添加到数组
        [self.dataArray addObject:mo];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewListCell" forIndexPath:indexPath];
    model *mo = self.dataArray[indexPath.row];
    cell.title.text =mo.title;
    //[cell.file_urlImageView sd_setImageWithURL:[NSURL URLWithString:mo.file_url] placeholderImage:nil];
    [cell.file_urlImageView sd_setImageWithURL:[NSURL URLWithString:@"http://admin.yaojinshu.cn/data/article/1473505871656867352.jpg"] placeholderImage:nil];
    // Configure the cell...
    
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
