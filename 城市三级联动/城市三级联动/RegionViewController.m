//
//  RegionViewController.m
//  test
//
//  Created by 席亚坤 on 16/11/18.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "RegionViewController.h"
#import "CityModel.h"
#import "YYModel.h"
@interface RegionViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) NSMutableArray *firstDataSource;
@property (nonatomic, strong) NSMutableArray *secondDataSource;
@property (nonatomic, strong) NSMutableArray *secondCity;
@property (nonatomic, strong) NSMutableArray *thirdDataSource;
@property (nonatomic, strong) NSMutableArray *thirdCity;
@property (nonatomic, assign) NSInteger firstRegionID;
@property (nonatomic, assign) NSInteger secondRegionID;
@property (nonatomic, assign) NSInteger firstIndex;
@property (nonatomic, assign) NSInteger secondIndex;
@property (nonatomic, assign) NSInteger thirdIndex;
@property (nonatomic, strong) CityModel *cityModel;
@property (nonatomic, strong) CityModel *provinceModel;
@property (nonatomic, strong) CityModel *secondModel;
///省
@property (nonatomic,strong) CityModel *returnProvince;
//市
@property (nonatomic,strong) CityModel *returnCity;
//区县
@property (nonatomic,strong) CityModel *returnRegion;


@end

@implementation RegionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //控制器通明的关键代码
    self.modalPresentationStyle =UIModalPresentationCustom;
    self.underView.layer.cornerRadius = 10;
    self.underView.layer.masksToBounds = YES;
    // 数据
    [self DiQuPeiZhiAction];

    [self.pickerView selectRow:self.firstIndex inComponent:0 animated:NO];
    [self.pickerView selectRow:self.secondIndex inComponent:1 animated:NO];
    [self.pickerView selectRow:self.thirdIndex inComponent:2 animated:NO];
}


#pragma mark - UIPickerViewDataSource

//分区个数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
//每个分区row个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
       // NSLog(@"%ld", self.firstDataSource.count);
        return self.firstDataSource.count;
    }else if (component == 1) {
        return self.secondCity.count;
    }else {
        return self.thirdCity.count;
    }
    return 10;
}
#pragma mark - UIPickerViewDelegate
//滚动点击row
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{
    if (component == 0) {
        self.firstIndex = row;
        CityModel *model = self.firstDataSource[row];
        [self.secondCity removeAllObjects];
        [self.thirdCity removeAllObjects];
        
        if (row == 0) {
            CityModel *beijingModel = [self.firstDataSource objectAtIndex:0];
            for (CityModel *model in self.secondDataSource) {
                if (beijingModel.regionId == model.superId) {
                    [self.secondCity addObject:model];
                }
            }
            CityModel *secondModel = self.secondCity[0];
            for (CityModel *model in self.thirdDataSource) {
                if (secondModel.regionId == model.superId) {
                    [self.thirdCity addObject:model];
                }
            }
        }else {
            self.firstRegionID = model.regionId;
            for (CityModel *addressModel in self.secondDataSource) {
                if (addressModel.superId == model.regionId) {
                    [self.secondCity addObject:addressModel];
                }
            }
            CityModel *secondModel = self.secondCity[0];
            for (CityModel *thirdModel in self.thirdDataSource) {
                if (secondModel.regionId == thirdModel.superId) {
                    [self.thirdCity addObject:thirdModel];
                }
            }
            [self.pickerView selectRow:0 inComponent:1 animated:YES];
            
        }
        [self.pickerView reloadAllComponents];
    }else if (component == 1) {
        [self.thirdCity removeAllObjects];
        self.secondIndex = row;
        CityModel *model = self.secondCity[row];
        self.secondRegionID = model.regionId;
        for (CityModel *addressModel in self.thirdDataSource) {
            if (addressModel.superId == model.regionId) {
                [self.thirdCity addObject:addressModel];
            }
        }
        [self.pickerView selectRow:0 inComponent:2 animated:YES];
        [self.pickerView reloadAllComponents];
    }else {
        self.thirdIndex = row;
    }

    
}
//row显示内容
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
    
    if (component == 0) {
        self.returnProvince = self.firstDataSource[row];
        return _returnProvince.regionName;
    }else if (component == 1) {
        self.returnCity  = self.secondCity[row];
        return _returnCity.regionName;
    }else {
        self.returnRegion  = self.thirdCity[row];
        return _returnRegion.regionName;
    }
}

//row高度
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
//    return 40;
//}
#pragma mark - 确定
- (IBAction)OKAction:(UIButton *)sender {
    NSString * name = [NSString stringWithFormat:@"%@ %@ %@",self.returnProvince.regionName,self.returnCity.regionName,self.returnRegion.regionName];
    NSDictionary * dicc = @{@"province_id":[NSString stringWithFormat:@"%ld",self.returnCity.regionId],@"city_id":[NSString stringWithFormat:@"%ld",self.returnCity.regionId],@"region_id":[NSString stringWithFormat:@"%ld",self.returnRegion.regionId],@"name":name,@"provinceName":self.returnProvince.regionName,@"cityName":self.returnCity.regionName,@"regionName":self.returnRegion.regionName};
    //block --赋值
    if (self.returnData) {
     self.returnData(dicc);
    }
  
    [self dismissViewControllerAnimated:YES completion:nil];
}
//block 传值 二  block 作为方法参数传值
-(void)ReqionReturn:(ReturnData)data{
    self.returnData = data;
}
#pragma mark - 取消
- (IBAction)cancelAction:(UIButton *)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}




#pragma mark -   地区数据
-(void)DiQuPeiZhiAction{
    self.firstIndex = 0;
    self.secondIndex = 0;
    self.thirdIndex = 0;
    NSArray *jsonArray = [[NSArray alloc]init];
    NSData *fileData = [[NSData alloc]init];
    NSUserDefaults *UD = [NSUserDefaults standardUserDefaults];
    if ([UD objectForKey:@"city"] == nil) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"region" ofType:@"json"];
        fileData = [NSData dataWithContentsOfFile:path];
        
        [UD setObject:fileData forKey:@"city"];
        [UD synchronize];
    }
    else {
        fileData = [UD objectForKey:@"city"];
    }
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    jsonArray = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingMutableLeaves error:nil];
    for (NSDictionary *dict in jsonArray) {
        [array addObject:dict];
    }

    for (NSDictionary *dic11 in array) {
        CityModel *model = [CityModel yy_modelWithDictionary:dic11];
        if (model.regionType == 1) {
            [self.firstDataSource addObject:model];
        }else if (model.regionType == 2) {
            [self.secondDataSource addObject:model];
        }else if (model.regionType == 3||model.regionType == 4) {
            [self.thirdDataSource addObject:model];
        }
    }
    CityModel *beijingModel = [self.firstDataSource objectAtIndex:0];
    for (CityModel *model in self.secondDataSource) {
        if (beijingModel.regionId == model.superId) {
            [self.secondCity addObject:model];
        }
    }
    CityModel *secondModel = self.secondCity[0];
    for (CityModel *model in self.thirdDataSource) {
        if (secondModel.regionId == model.superId) {
            [self.thirdCity addObject:model];
        }
    }
    
    
    
}
- (NSMutableArray *)firstDataSource {
    if (!_firstDataSource) {
        self.firstDataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _firstDataSource;
}
- (NSMutableArray *)secondDataSource {
    if (!_secondDataSource) {
        self.secondDataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _secondDataSource;
}
- (NSMutableArray *)thirdDataSource {
    if (!_thirdDataSource) {
        self.thirdDataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _thirdDataSource;
}
- (NSMutableArray *)secondCity {
    if (!_secondCity) {
        self.secondCity = [NSMutableArray arrayWithCapacity:0];
    }
    return _secondCity;
}
- (NSMutableArray *)thirdCity {
    if (!_thirdCity) {
        self.thirdCity = [NSMutableArray arrayWithCapacity:0];
    }
    return _thirdCity;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
