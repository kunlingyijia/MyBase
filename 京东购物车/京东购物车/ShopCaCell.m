//
//  ShopCaCell.m
//  京东购物车
//
//  Created by 席亚坤 on 16/11/21.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ShopCaCell.h"
#import "PublicBtn.h"
#import "PublicTF.h"
#import "CarModel.h"
@implementation ShopCaCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.AddAndDelView.layer.cornerRadius= 3.0;
    self.AddAndDelView.layer.masksToBounds = YES;
    self.AddAndDelView.layer.borderWidth= 1.0;
    self.AddAndDelView.layer.borderColor = [UIColor grayColor].CGColor;
    self.textTf.userInteractionEnabled = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)deleteACtion:(PublicBtn *)sender {
    int a=  [self.textTf.text intValue];
    if ([self.textTf.text intValue]>1) {
         a--;
        self.textTf.text = [NSString stringWithFormat:@"%d",a];
        
    }

}
- (IBAction)addAction:(PublicBtn *)sender {
    int a=  [self.textTf.text intValue];
    if ([self.textTf.text intValue]>0) {
        a++;
        self.textTf.text = [NSString stringWithFormat:@"%d",a];
    }


}

-(void)cellGetData:(CarModel*)model{
    if ([model.chose isEqualToString:@"1"]) {
        [self.choseBtn setImage:[UIImage imageNamed:@"购物车-选中打钩"] forState:(UIControlStateNormal)];
    }else{
        [self.choseBtn setImage:[UIImage imageNamed:@"购物车-未选中"] forState:(UIControlStateNormal)];
    }
    self.textTf.text =[NSString stringWithFormat:@"%@",model.shu];
    if ([self.textTf.text isEqualToString:@"1"]) {
        self.deleteBtn.userInteractionEnabled =  NO;
    }else{
        self.deleteBtn.userInteractionEnabled = YES;
    }

}


@end
