//
//  Person.m
//  001--Runtime消息机制
//
//  Created by H on 17/1/18.
//  Copyright © 2017年 H. All rights reserved.
//

#import "Person.h"

@implementation Person

+(void)run
{
    NSLog(@"类方法在跑");
}

-(void)eatWithFood:(NSString *)food
{
    NSLog(@"吃%@",food);
}

-(void)run{
    NSLog(@"哥么跑起来了");
}

@end
