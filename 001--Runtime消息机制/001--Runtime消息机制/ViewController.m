//
//  ViewController.m
//  001--Runtime消息机制
//
//  Created by H on 17/1/18.
//  Copyright © 2017年 H. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
//引入message就行了，因为message包含runtime
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person * p = [[Person alloc]init];
    
    //Xocde 5.0之后,苹果不建议使用底层的函数
    
    //给p 发送一个消息
//    objc_msgSend(p, @selector(run));
    //参数用逗号隔开
    objc_msgSend(p, @selector(eatWithFood:),@"香蕉");
    
    
    //OC  调用类方法   Class类型它也是一个特殊的对象!!
//    [Person run];
    Class personClass = [Person class];
    
//    [personClass performSelector:@selector(run)];
    
    //运行时
    objc_msgSend(personClass, @selector(run));
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
