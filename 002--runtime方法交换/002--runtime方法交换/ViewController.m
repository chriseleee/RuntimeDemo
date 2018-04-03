//
//  ViewController.m
//  002--runtime方法交换
//
//  Created by H on 17/1/18.
//  Copyright © 2017年 H. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建RUL 如此的简单!! But!!!
    //如果字符串有中文,这个url就创建不成功!那么我们发送请求就会出错!!
    //OC中没有url为空的检测机制!!Swift里面有可选项!
    //我需要给URLWithString 添加一个检测是否为空的功能!!
    NSURL * url = [NSURL URLWithString:@"www.baidu.com/中文"];
    NSLog(@"%@",url);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
