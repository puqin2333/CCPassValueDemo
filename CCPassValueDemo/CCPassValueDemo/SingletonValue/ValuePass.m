//
//  ValuePass.m
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "ValuePass.h"

@implementation ValuePass
//创建单例
static ValuePass *valuePass = nil;
+(instancetype)sharedHadle{
    static dispatch_once_t token;
    //使用dispatch_once一次性代码，整个程序只会执行一次，默认是线程安全的
    dispatch_once(&token, ^{
        
        valuePass = [[ValuePass alloc] init];
        
    });
    return valuePass;
}
@end
