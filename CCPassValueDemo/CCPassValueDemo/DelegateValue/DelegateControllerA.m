//
//  DelegateControllerA.m
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "DelegateControllerA.h"
#import "DelegateControllerB.h"
#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height
@interface DelegateControllerA ()<DelegateControllerBDelegate>
@property(nonatomic, strong) UILabel *label;
@end

@implementation DelegateControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"代理传值A";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.3, kCCDeviceHeight*0.3, kCCDeviceWidth*0.4, 50)];
    _label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btn];
    btn.layer.cornerRadius = 5.0f;
    btn.frame = CGRectMake(kCCDeviceWidth*0.1, kCCDeviceHeight*0.75, kCCDeviceWidth * 0.8,  kCCDeviceHeight * 0.08);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"代理传值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click{
    DelegateControllerB *vc = [[DelegateControllerB alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc.delegate = self;
}
//实现代理方法
- (void)pass:(NSString *)str{
    _label.text = str;
}

@end
