//
//  SingletonControllerA.m
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "SingletonControllerA.h"
#import "SIngletonViewControllerB.h"
#import "ValuePass.h"
#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height
@interface SingletonControllerA ()
@property(nonatomic, strong) UILabel *label;
@end

@implementation SingletonControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"单例传值A";
    self.view.backgroundColor = [UIColor whiteColor];
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.3, kCCDeviceHeight*0.3, kCCDeviceWidth*0.4, 50)];
    _label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btn];
    btn.layer.cornerRadius = 5.0f;
    btn.frame = CGRectMake(kCCDeviceWidth*0.1, kCCDeviceHeight*0.75, kCCDeviceWidth * 0.8,  kCCDeviceHeight * 0.08);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"单例传值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click{
    SIngletonViewControllerB *vc = [[SIngletonViewControllerB alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    ValuePass *value = [ValuePass sharedHadle];
    _label.text = value.string;
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
