//
//  NSKVONotifing_Person.m
//  UsageOfRuntime
//
//  Created by chriseleee on 2018/10/13.
//  Copyright © 2018年 chrise.le. UsageOfRuntime. All rights reserved.
//

#import "NSKVONotifing_Person.h"

@implementation NSKVONotifing_Person

/** 重写set方法 */
-(void)setAge:(int)age{
    [super setAge:age];
    //这两个方法会默认调用观察者的observeValueForKeyPath方法
    [self willChangeValueForKey:@"age"];
    [self didChangeValueForKey:@"age"];
}

@end
