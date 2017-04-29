//
//  PropertyControllerA.m
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "PropertyControllerA.h"
#import "PropertyControllerB.h"

#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface PropertyControllerA ()<UITextFieldDelegate>
@property(nonatomic, strong) UITextField *textField;
@end

@implementation PropertyControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"属性传值A";
    self.view.backgroundColor = [UIColor whiteColor];
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.2, kCCDeviceHeight*0.3, kCCDeviceWidth*0.6, 60)];
    self.textField.backgroundColor = [UIColor blueColor];
    self.textField.placeholder = @"请输入....";
    self.textField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_textField];
}

//实现页面跳转
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     PropertyControllerB *vc = [PropertyControllerB new];
    [self.navigationController pushViewController:vc animated:YES];
    vc.str = self.textField.text;
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
