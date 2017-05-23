//
//  TableViewController.m
//  物流订单时间轴
//
//  Created by 席亚坤 on 16/11/25.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
@interface TableViewController ()
///数据
@property (nonatomic,strong)NSMutableArray * dataArray;
@property (nonatomic,strong)NSMutableArray *imageArr;
@end

@implementation TableViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray arrayWithCapacity:0];
    }return _dataArray;
}
-(NSMutableArray *)imageArr{
    if (!_imageArr) {
        self.imageArr = [NSMutableArray arrayWithCapacity:0];

    }return _imageArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *newStr = @"19";
    for(int i =0; i < [newStr length]; i++)
    {
       
        int  a =[newStr characterAtIndex:i];
     
        if (a==49) {
            
            NSLog(@"%d",a);
        }
        if (a==50) {
           
            NSLog(@"%d",a);
        }
        if (a==51) {
            NSLog(@"%d",a);
            
        }
        if (a==52) {
            
            NSLog(@"%d",a);
        }
        if (a==53) {
            
        }
        if (a==54) {
            
            NSLog(@"%d",a);
        }
        if (a==55) {
            
            NSLog(@"%d",a);
        }
        if (a==56) {
            
            NSLog(@"%d",a);
        }
        if (a==57) {
            
            NSLog(@"%d",a);
        }
        
    
    }
    
    
    for (int i =0; i<10; i++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"我是第%d行",i]];
        
    }
    int a = (int)self.dataArray.count;
    if (a==0) {
        [self.imageArr removeAllObjects];
        [self.imageArr addObject:@"red_point"];
    }else if(a==1){
        [self.imageArr removeAllObjects];
        self.imageArr  = [@[@"red_line" ,@"line_up"]mutableCopy];
    }else if (a>1){
        [self.imageArr  addObject:@"red_line"];
        NSLog(@"%@",self.imageArr);
        for (int i=1; i<a-1; i++) {
           
            [self.imageArr  addObject:@"line_center"];
        }
        [self.imageArr  addObject:@"line_up"];
         }else{
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
   TableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat: @"%@",self.dataArray[indexPath.row]]];
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:[UIFont systemFontOfSize:20]
     
                          range:NSMakeRange(0, 4)];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:[UIColor redColor]
     
                          range:NSMakeRange(0, 4)];
    
    
    cell.label.attributedText = AttributedStr;
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat: @"%@",self.imageArr[indexPath.row]]];
 
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
