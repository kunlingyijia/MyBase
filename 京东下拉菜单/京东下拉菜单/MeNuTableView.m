//
//  MeNuTableView.m
//  京东下拉菜单
//
//  Created by 席亚坤 on 16/10/31.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "MeNuTableView.h"
#import "MenuCell.h"
#import "MenuHeader.h"
#define FristColor        [UIColor redColor]
#define ChangeColor         [UIColor blackColor]


@implementation MeNuTableView{
    //展开
    BOOL is_an;
    //改变颜色
    BOOL is_BtnOneChangeColer;
    //第三个imageView 是否朝下
    BOOL is_BtnThreeImageViewDown;
    ///数据
    NSMutableArray * dataArray;
    int x;
    int y;
    int height ;
    BOOL  is_Selected;
    MenuHeader *menuH;
}
- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSMutableArray*)data{
    self = [super initWithFrame:frame];
    if (self) {
        x = frame.origin.x;
        y =frame.origin.y;
        height = frame.size.height;
        //NSLog(@"%d",height);

        dataArray = data;
        self.delegate = self;
        self.dataSource = self;
        self.scrollEnabled =NO; //设置tableview 不能滚动
        self.userInteractionEnabled = YES;
        is_an = NO;
        is_BtnOneChangeColer = YES;
        is_BtnThreeImageViewDown = NO;
        is_Selected = YES;
        [self registerNib:[UINib nibWithNibName:@"MenuCell" bundle:nil] forCellReuseIdentifier:@"MenuCell"];
        //注册页眉
        [self registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
        self.backgroundColor = [UIColor blueColor];
        //点击空白返回
        [self performSelector:@selector(back) withObject:nil];
       // if ([menuH.BtnOne.titleLabel.text isEqualToString:[NSString stringWithFormat:@"%@",dataArray[0] ]]) {
        
        [self reloadData];

       // }

    }
    return self;

}
#pragma tableView 代理方法
//tab分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //分区个数
    return 2;
}
///tab个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return dataArray.count;

    }
    return 0;
}
//tab设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell" forIndexPath:indexPath];
    if (indexPath.section == 1) {
        //cell 赋值
        cell.label.text = [NSString stringWithFormat:@"%@",dataArray[indexPath.row]];
       
           }
    
    if (indexPath.section == 1&&indexPath.row==0&& is_Selected == YES) {
        cell.label.textColor = [UIColor redColor];
    }
       return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        //将当前点击的cell传递给thisCell
        MenuCell *thisCell = [tableView cellForRowAtIndexPath: indexPath];
        if (thisCell.accessoryType == UITableViewCellAccessoryNone)
        {
            thisCell.accessoryType = UITableViewCellAccessoryCheckmark;
            NSLog(@"当前选择了：%@", thisCell.label.text);
        }
        else
        {
            thisCell.accessoryType = UITableViewCellAccessoryNone;
            NSLog(@"当前取消选择了：%@", thisCell.label.text);
        }
        
        //[tableView deselectRowAtIndexPath:indexPath animated:YES];
        [menuH.BtnOne setTitle:[NSString stringWithFormat:@"%@",dataArray[indexPath.row]] forState:(UIControlStateNormal)];
        menuH.ImageViewOne.image = [UIImage imageNamed:@"红下"];
        is_Selected = NO;
        [self back];
        //代理
        if ([self.Menudelegate respondsToSelector:@selector(oneBtnAction)]) {
            [self.Menudelegate oneBtnAction];
        }

    }
    }
//自定义页眉
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headerView  = nil;
    if (section==0) {
        
   // NSDictionary *bigDic = bigArr[section];
    UITableViewHeaderFooterView *header  = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"header"];

//        UIButton *buttion = [UIButton buttonWithType:(UIButtonTypeSystem)];
//        buttion.frame = CGRectMake(0, 0, 100, 50);
//        buttion.backgroundColor = [UIColor grayColor];
//        [buttion addTarget:self action:@selector(is_An:) forControlEvents:(UIControlEventTouchUpInside)];
        // [header.contentView addSubview:buttion];
        menuH =  [[[NSBundle mainBundle] loadNibNamed:@"MenuHeader" owner:nil options:nil] firstObject];
        //页眉上添加点击事件
        [self addBtnAction];
                menuH.frame =header.frame;
        [header.contentView addSubview:menuH];
        headerView = header;
    headerView.contentView. backgroundColor = [UIColor yellowColor];
        return headerView;

    }
   return headerView;
    
}
#pragma tableView -- 页眉上的btn
-(void)addBtnAction{
    
    [menuH.BtnOne addTarget:self action:@selector(BtnOne:) forControlEvents:(UIControlEventTouchUpInside)];
    [menuH.BtnTwo addTarget:self action:@selector(BtnTwo:) forControlEvents:(UIControlEventTouchUpInside)];
    [menuH.BtnThree addTarget:self action:@selector(BtnThree:) forControlEvents:(UIControlEventTouchUpInside)];
    [menuH.BtnFour addTarget:self action:@selector(BtnFour:) forControlEvents:(UIControlEventTouchUpInside)];

    
}

-(void)BtnOne:(UIButton*)sender{
    
//    if (is_an ==NO &&    is_BtnOneChangeColer == YES
//) {
//        is_an = YES;
//        
//        
//        [UIView animateWithDuration:0.5 animations:^{
//            self.frame = CGRectMake(x, y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//            NSLog(@"展开");
//             menuH.ImageViewOne.image = [UIImage imageNamed:@"红上"];
//            [self layoutIfNeeded];
//        }];
//        
//        [self reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
//        
//       
//
//    }else if(is_an ==YES &&    is_BtnOneChangeColer == YES){
//        is_an = NO;
//   
//        [UIView animateWithDuration:0.5 animations:^{
//             menuH.ImageViewOne.image = [UIImage imageNamed:@""];
//           menuH.ImageViewOne.image = [UIImage imageNamed:@"红下"];
//            self.frame = CGRectMake(x, y, [UIScreen mainScreen].bounds.size.width, 50);
//            [self layoutIfNeeded];
//            NSLog(@"收");
//        }];
//    }else{
//        [self BtnOneOhterChangeCollor:sender];
//        is_BtnOneChangeColer = YES;
//        is_BtnThreeImageViewDown = YES;
//        
//        NSLog(@"刷新");
//        //代理
//        [self BtnOneAgency];
//        
//        
//    }
    
    
     is_BtnThreeImageViewDown = YES;
    [self BtnOneOhterChangeCollor :sender];
    //代理
    
    [self BtnOneAgency];

    
    
}

-(void)BtnTwo:(UIButton*)sender{
    is_BtnOneChangeColer = NO;
    is_BtnThreeImageViewDown = YES;

    [self back];
    [self BtnTwoOhterChangeCollor:sender];
    //代理
    [self BtnTwoAgency];
    
}
-(void)BtnThree:(UIButton*)sender{
    is_BtnOneChangeColer = NO;
    [self back];
    [self BtnThreeOhterChangeCollor:sender];
    //代理
    //[self BtnThreeAgency];

    
    
}
-(void)BtnFour:(UIButton*)sender{
    is_BtnOneChangeColer = NO;
    is_BtnThreeImageViewDown = YES;

    [self back];
    [self BtnFourOhterChangeCollor:sender];
    //代理
    [self BtnFourAgency];
    
    
}
//点击BtnOne 其他改变颜色
-(void)BtnOneOhterChangeCollor:(UIButton*)sender{
    [sender setTitleColor:FristColor forState:(UIControlStateNormal)];    [menuH.BtnTwo setTitleColor:ChangeColor forState:(UIControlStateNormal)];
     [menuH.BtnThree setTitleColor:ChangeColor forState:(UIControlStateNormal)];
     [menuH.BtnFour setTitleColor:ChangeColor forState:(UIControlStateNormal)];
    menuH.ImageViewOne.image = [UIImage imageNamed:@"红下"];
    menuH.imageViewTwo.image = [UIImage imageNamed:@"灰下"];
    menuH.imageViewThree.image = [UIImage imageNamed:@"全灰"];
    
    menuH.imageViewFour.image = [UIImage imageNamed:@"灰下"];
    

    
}
//点击BtnTwo 其他改变颜色
-(void)BtnTwoOhterChangeCollor:(UIButton*)sender{
    [sender setTitleColor:FristColor forState:(UIControlStateNormal)];
    
    [menuH.BtnOne setTitleColor:ChangeColor forState:(UIControlStateNormal)];
    
    [menuH.BtnThree setTitleColor:ChangeColor forState:(UIControlStateNormal)];
       [menuH.BtnFour setTitleColor:ChangeColor forState:(UIControlStateNormal)];
    menuH.ImageViewOne.image = [UIImage imageNamed:@"灰下"];
    menuH.imageViewTwo.image = [UIImage imageNamed:@"红下"];
    menuH.imageViewThree.image = [UIImage imageNamed:@"全灰"];
    
    menuH.imageViewFour.image = [UIImage imageNamed:@"灰下"];
    
}
//点击BtnThree 其他改变颜色
-(void)BtnThreeOhterChangeCollor:(UIButton*)sender{
    if (is_BtnThreeImageViewDown==YES
        ) {
        is_BtnThreeImageViewDown= NO;
         menuH.imageViewThree.image = [UIImage imageNamed:@"上灰下红"];
        //点击BtnTwo 箭头向下 遵从代理
        if ([self.Menudelegate respondsToSelector:@selector(threeBtnActionDown)]) {
            [self.Menudelegate threeBtnActionDown];
            NSLog(@"价格低---刷新");

        }

    }else{
        is_BtnThreeImageViewDown=YES;
        menuH.imageViewThree.image = [UIImage imageNamed:@"上红下灰"];
        //点击BtnTwo 箭头向箭头遵从代理
        if ([self.Menudelegate respondsToSelector:@selector(threeBtnActionUp)]) {
            [self.Menudelegate threeBtnActionUp];
            NSLog(@"价格高---刷新");

        }

    }
    [sender setTitleColor:FristColor forState:(UIControlStateNormal)];    [menuH.BtnOne setTitleColor:ChangeColor forState:(UIControlStateNormal)];
    [menuH.BtnTwo setTitleColor:ChangeColor forState:(UIControlStateNormal)];
    [menuH.BtnFour setTitleColor:ChangeColor forState:(UIControlStateNormal)];
    menuH.ImageViewOne.image = [UIImage imageNamed:@"灰下"];
    menuH.imageViewTwo.image = [UIImage imageNamed:@"灰下"];
    menuH.imageViewFour.image = [UIImage imageNamed:@"灰下"];

    
    
}
//点击BtnFour 其他改变颜色
-(void)BtnFourOhterChangeCollor:(UIButton*)sender{
    [sender setTitleColor:FristColor forState:(UIControlStateNormal)];
    [menuH.BtnOne setTitleColor:ChangeColor forState:(UIControlStateNormal)];
    [menuH.BtnTwo setTitleColor:ChangeColor forState:(UIControlStateNormal)];
    [menuH.BtnThree setTitleColor:ChangeColor forState:(UIControlStateNormal)];
    menuH.ImageViewOne.image = [UIImage imageNamed:@"灰下"];
    menuH.imageViewTwo.image = [UIImage imageNamed:@"灰下"];
    menuH.imageViewThree.image = [UIImage imageNamed:@"全灰"];
    
    menuH.imageViewFour.image = [UIImage imageNamed:@"红下"];
    
    
}
//点击BtnOne 遵从代理
-(void)BtnOneAgency{
    if ([self.Menudelegate respondsToSelector:@selector(oneBtnAction)]) {
        [self.Menudelegate oneBtnAction];
        NSLog(@"综合---刷新");
    }
    
    
}

//点击BtnTwo 遵从代理
-(void)BtnTwoAgency{
    if ([self.Menudelegate respondsToSelector:@selector(twoBtnAction)]) {
        [self.Menudelegate twoBtnAction];
        NSLog(@"销量---刷新");

    }
    
    
}


-(void)BtnThreeAgency{
    if ([self.Menudelegate respondsToSelector:@selector(threeBtnActionUp)]) {
        [self.Menudelegate threeBtnActionUp];
        NSLog(@"价格---刷新");

    }
    
    
}
//点击BtnFour 遵从代理
-(void)BtnFourAgency{
    if ([self.Menudelegate respondsToSelector:@selector(fourBtnAction)]) {
        [self.Menudelegate fourBtnAction];
    }
    
    
}
-(void)back{
    if (is_an==YES) {
        is_an = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(x, y, [UIScreen mainScreen].bounds.size.width, 50);
            [self layoutIfNeeded];
        }];
    }

    
}
-(void)is_An:(UIButton*)sender{
   // is_an = !is_an;
    if (is_an ==NO ) {
        is_an = YES;
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(x, y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            [self layoutIfNeeded];
        }];
        
        [self reloadData];
    }else{
        is_an = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(x, y, [UIScreen mainScreen].bounds.size.width, 50);
            [self layoutIfNeeded];
        }];
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 0;
    }
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 50;
    }
    return 0;
}
//-(NSMutableArray *)dataArray{
//    if (!_dataArray) {
//        self.dataArray = [NSMutableArray arrayWithCapacity:1];
//    }return _dataArray;
//}
@end
