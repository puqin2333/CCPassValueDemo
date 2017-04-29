//
//  ViewController.m
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "ViewController.h"
#import "PropertyControllerA.h"
#import "DelegateControllerA.h"
#import "BlockControllerA.h"
#import "SingletonControllerA.h"
#import "NotificationControllerA.h"

#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate ,UITableViewDataSource>
@property(nonatomic, strong) UITableView *myTableView;
@property(nonatomic, copy) NSArray *listArray;
@end

@implementation ViewController

- (UITableView *)myTableView{
    if (!_myTableView) {
        self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake( kCCDeviceWidth*0.05, kCCDeviceHeight*0.1, kCCDeviceWidth * 0.9, kCCDeviceHeight * 0.8) style:UITableViewStylePlain];
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
        self.myTableView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.myTableView];
        self.myTableView.tableFooterView = [UIView new];
    }
    return _myTableView;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"界面传值";
    self.view.backgroundColor = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0];
    self.listArray = [NSArray arrayWithObjects:@"属性传值", @"代理传值",@"block传值",@"单例传值",@"通知传值",nil];
    [self myTableView];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:str];
        cell.textLabel.text = _listArray[indexPath.row];
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            PropertyControllerA *VC = [[PropertyControllerA alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 1:{
            DelegateControllerA *VC = [[DelegateControllerA alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 2:{
            BlockControllerA *VC = [[BlockControllerA alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 3:{
            SingletonControllerA *VC = [[SingletonControllerA alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 4:{
            NotificationControllerA *VC = [[NotificationControllerA alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
