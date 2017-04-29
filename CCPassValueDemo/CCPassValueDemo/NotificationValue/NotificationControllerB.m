//
//  NotificationControllerB.m
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "NotificationControllerB.h"
#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height
@interface NotificationControllerB ()
@property(nonatomic,strong)UITextField *textField;
@end

@implementation NotificationControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"通知传值B";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor greenColor];
    button.frame = CGRectMake(kCCDeviceWidth*0.1, kCCDeviceHeight*0.75, kCCDeviceWidth * 0.8,  kCCDeviceHeight * 0.08);
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown ];
    [self.view addSubview:button];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.2, kCCDeviceHeight*0.3, kCCDeviceWidth*0.6, 60)];
    self.textField.backgroundColor = [UIColor blueColor];
    self.textField.placeholder = @"请输入....";
    self.textField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_textField];
}
- (void)click:(UIButton *)sender{
    
    //创建字典
    NSDictionary *dict = [NSDictionary dictionaryWithObject:self.textField.text forKey:@"key"];
    //发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"volue" object:self userInfo:dict];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
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
