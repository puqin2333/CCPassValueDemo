//
//  DelegateControllerB.h
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>
//设置代理
@class DelegateControllerB;
@protocol DelegateControllerBDelegate <NSObject>
-(void)pass:(NSString*)str;
@end

@interface DelegateControllerB : UIViewController
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,weak)id <DelegateControllerBDelegate> delegate;//weak防止循环引用
@end
