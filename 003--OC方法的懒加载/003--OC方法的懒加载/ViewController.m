//
//  ViewController.m
//  003--OC方法的懒加载
//
//  Created by H on 17/1/18.
//  Copyright © 2017年 H. All rights reserved.
//

#import "ViewController.h"
#import "Pseron.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Pseron * p = [[Pseron alloc]init];
    //懒加载  用到的时候在加载方法!!
//    [p performSelector:@selector(eat)];
//    [p performSelector:@selector(eat:) withObject:@"板烧鸡腿堡"];
    
    [p performSelector:@selector(run)];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
