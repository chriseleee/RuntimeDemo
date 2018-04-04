//
//  Person.m
//  001--Runtime消息机制
//
//  Created by H on 17/1/18.
//  Copyright © 2017年 H. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>


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


//动态方法绑定
+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@"sel = %@",NSStringFromSelector(sel));
    if (sel == @selector(run)) {
        class_addMethod(self, sel, (IMP)newRun, "v@:");
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

void newRun(id self , SEL sel){
    NSLog(@"addMethod is runing");
}

@end
