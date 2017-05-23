//
//  UITableView+NoData.m
//  UITableView没有数据时等待图 类别
//
//  Created by 席亚坤 on 16/11/19.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "UITableView+NoData.h"

@implementation UITableView (NoData)
- (void)tableViewDisplayWitimage:(NSString *)image ifNecessaryForRowCount:(NSUInteger) rowCount
{
    if (rowCount == 0) {
        UIImageView * imageV= [[UIImageView alloc]init];
        imageV.image = [UIImage imageNamed:@"暂无数据"];
        imageV.contentMode =  UIViewContentModeCenter;
        //imageV.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        imageV.clipsToBounds  = YES;
        self.backgroundView= imageV;
        NSLog(@"数据");
    }else{
        self.backgroundView = nil;
    }

}


-(void)tableViewregisterNibArray:(NSArray*)cellArrary{
    if (cellArrary.count !=0) {
        for (NSString *cellStr in cellArrary) {
            [self registerNib:[UINib nibWithNibName:cellStr bundle:nil] forCellReuseIdentifier:cellStr];
            
        }
        
        
    }
}
-(void)tableViewregisterClassArray:(NSArray*)cellArrary{
    if (cellArrary.count !=0) {
        for (NSString *cellStr in cellArrary) {
            [self registerClass:[NSClassFromString(cellStr) class] forCellReuseIdentifier:cellStr];
        }
    }
}

@end
