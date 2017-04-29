//
//  PropertyControllerB.m
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "PropertyControllerB.h"
#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface PropertyControllerB ()

@end

@implementation PropertyControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"属性传值B";
    self.view.backgroundColor = [UIColor whiteColor];
    //创建一个label用来显示接收到的内容
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.3, kCCDeviceHeight*0.3, kCCDeviceWidth*0.4, 50)];
    label.backgroundColor = [UIColor redColor];
    label.text = _str;
    [self.view addSubview:label];
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
