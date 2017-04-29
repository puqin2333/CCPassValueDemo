//
//  ValuePass.h
//  CCPassValueDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/4/29.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValuePass : NSObject
@property(nonatomic,strong)NSString *string;
+(instancetype)sharedHadle;
@end
