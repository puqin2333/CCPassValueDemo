//
//  BlockControllerB.h
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>
//定义有参无返回值的匿名函数(传递字符串)
typedef void (^myBlock)(NSString *);

@interface BlockControllerB : UIViewController
//block 的属性
@property(nonatomic, strong) myBlock block;
@end

