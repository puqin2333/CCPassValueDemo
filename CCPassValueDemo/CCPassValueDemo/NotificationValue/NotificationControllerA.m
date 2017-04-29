//
//  NotificationControllerA.m
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "NotificationControllerA.h"
#import "NotificationControllerB.h"
#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height
@interface NotificationControllerA ()
@property(nonatomic, strong) UILabel *label;
@end

@implementation NotificationControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"通知传值A";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.3, kCCDeviceHeight*0.3, kCCDeviceWidth*0.4, 50)];
    _label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btn];
    btn.layer.cornerRadius = 5.0f;
    btn.frame = CGRectMake(kCCDeviceWidth*0.1, kCCDeviceHeight*0.75, kCCDeviceWidth * 0.8,  kCCDeviceHeight * 0.08);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"通知传值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volue:) name:@"volue" object:nil];
}
- (void)click{
    NotificationControllerB *vc = [[NotificationControllerB alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)volue:(NSNotification *)sender{
    
    self.label.text = sender.userInfo[@"key"];
    NSLog(@"%@",sender.userInfo[@"key"]);
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
