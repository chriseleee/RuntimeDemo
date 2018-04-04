//
//  Person.m
//  001--Runtime消息机制
//
//  Created by H on 17/1/18.
//  Copyright © 2017年 H. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
#import "PersonTwo.h"

@implementation Person



//-(void)run{
//    NSLog(@"哥么跑起来了");
//}


//动态方法绑定--对象方法
+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@"sel = %@",NSStringFromSelector(sel));
//    if (sel == @selector(run)) {//如果方法为run方法
//        //我就动态添加一个方法
//        class_addMethod(self, sel, (IMP)newRun, "v@:");
//        return YES;
//    }
    
    return [super resolveInstanceMethod:sel];
}


void newRun(id self , SEL sel){
    NSLog(@"addMethod is runing");
}
//方法重定向
-(id)forwardingTargetForSelector:(SEL)aSelector{
    NSLog(@"sel = %@",NSStringFromSelector(aSelector));
//    return [PersonTwo new];
    return [super forwardingTargetForSelector:aSelector];
}


//方法签名---
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel isEqualToString:@"run"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }else{
        return [super methodSignatureForSelector:aSelector];
    }
}

//拿到方法签名后派发消息
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"---------%@------------",anInvocation);
    //取得消息
    SEL selector = [anInvocation selector];
    
    //转发消息
    PersonTwo *ptwo = [PersonTwo new];
    
    if ([ptwo respondsToSelector:selector]) {
        //  将方法转发给PersonTwo
        [anInvocation invokeWithTarget:ptwo];
    }else{
        return [super forwardInvocation:anInvocation];
    }
    
}

-(void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"此方法不存在");
}


@end
