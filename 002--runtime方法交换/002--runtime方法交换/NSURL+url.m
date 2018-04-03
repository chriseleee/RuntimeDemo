//
//  NSURL+url.m
//  002--runtime方法交换
//
//  Created by H on 17/1/18.
//  Copyright © 2017年 H. All rights reserved.
//

#import "NSURL+url.h"
#import <objc/message.h>

@implementation NSURL (url)

//加载这个类的load方法
+(void)load{
    //class_getClassMethod : 获取类方法
    //class_getInstanceMethod : 获取对象方法
    
    //1.那到两个方法 苹果原来的URLWithString  和HK_URLWithString
    //2.1 类类型
    //2.2 方法编号
    Method mURLWithStr = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method mHK_URLWithStr = class_getClassMethod([NSURL class], @selector(My_URLWithString:));
    
    //2.交换这两个方法!(你调用A 个么会执行 B )
    method_exchangeImplementations(mURLWithStr, mHK_URLWithStr);
    
}


+(instancetype)My_URLWithString:(NSString *)URLString
{
    NSURL * url = [NSURL My_URLWithString:URLString];//会找 URLWithString这个方法
    if (url == nil) {
        NSLog(@"哥么是一个空的URL");
    }
    return url;
    
}

@end
