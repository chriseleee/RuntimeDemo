//
//  Person.m
//  UsageOfRuntime
//
//  Created by chriseleee on 2018/10/13.
//  Copyright © 2018年 chrise.le. UsageOfRuntime. All rights reserved.
//

#import "Person.h"

@interface Person  (){
    NSString* _address;
}

@property (assign, nonatomic) long phoneNum;


@end

@implementation Person


-(void)eat{
    NSLog(@"eat");
}

-(void)run{
    NSLog(@"run");
}

@end
