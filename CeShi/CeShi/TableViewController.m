//
//  TableViewController.m
//  CeShi
//
//  Created by 席亚坤 on 16/10/22.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "TableViewController.h"
#import "NetManager.h"
#import "YYModel.h"
#import "Model.h"
@interface TableViewController ()
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation TableViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [ NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
   
    [NetManager getRequestwithURL:@"http://c.3g.163.com/nc/video/home/0-10.html" withSuccessResult:^(id successResult) {
       // NSLog(@"成功%@",successResult[@"videoList"]);
       // NSLog(@"%ld",_dataArray.count);
        NSArray *arr =successResult[@"videoList"];        for (NSDictionary *dic in arr) {
        [self.dataArray addObject:[Model  yy_modelWithJSON:dic]];
        }
    
        [self.tableView reloadData];

    } withErrorResult:^(NSError *errorResult) {
        NSLog(@"%@",errorResult);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Model *mo = self.dataArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@hang",mo.videoTopic.tname];
    cell.backgroundColor = [UIColor redColor];
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
