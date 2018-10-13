//
//  CodingModel.m
//  ImageModel
//
//  Created by chrise on 2017/9/15.
//  Copyright © 2017年 chrise. All rights reserved.
//

#import "CodingModel.h"
#import <objc/runtime.h>
@implementation CodingModel
- (void)encodeWithCoder:(NSCoder *)coder
{
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        //拿出属性的名称
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * KEY = [NSString stringWithUTF8String:name];
        //取出属性的值
        id value = [self valueForKey:KEY];
        //归档
        [coder encodeObject:value forKey:KEY];
    }
    
    //c语言里面需要释放指针!!
    free(ivars);
}

//解档!!
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            //拿出属性的名称
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * KEY = [NSString stringWithUTF8String:name];
            //解档
            id value = [coder decodeObjectForKey:KEY];
            //将值设置到属性上 KVC
            [self setValue:value forKey:KEY];
        }
        
        //c语言里面需要释放指针!!
        free(ivars);
    }
    return self;
}

@end
