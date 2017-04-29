//
//  DelegateControllerB.m
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "DelegateControllerB.h"
#import "DelegateControllerA.h"
#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface DelegateControllerB ()

@end

@implementation DelegateControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"代理传值B";
    self.view.backgroundColor = [UIColor whiteColor];
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.2, kCCDeviceHeight*0.3, kCCDeviceWidth*0.6, 60)];
    self.textField.backgroundColor = [UIColor blueColor];
    self.textField.placeholder = @"请输入....";
    self.textField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_textField];
}

//返回上一级页面
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated:YES];
    [_delegate pass:_textField.text];
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
