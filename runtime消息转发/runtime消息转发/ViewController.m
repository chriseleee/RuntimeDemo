//
//  ViewController.m
//  runtime消息转发
//
//  Created by chriseleee on 2018/4/4.
//  Copyright © 2018年 chriseleee. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *pOne = [Person new];
    [pOne run];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
