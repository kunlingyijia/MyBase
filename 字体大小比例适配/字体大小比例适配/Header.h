//
//  Header.h
//  字体大小比例适配
//
//  Created by 席亚坤 on 17/2/28.
//  Copyright © 2017年 席亚坤. All rights reserved.
//
#ifndef Header_h
#define Header_h
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)
#define SizeOne 9*SizeScale
#define SizeTwo 10 *SizeScale
#define SizeThree 11 *SizeScale
#define SizeFour 12 *SizeScale






#endif /* Header_h */
