//
//  ViewController.m
//  UsageOfRuntime
//
//  Created by chriseleee on 2018/10/13.
//  Copyright © 2018年 chrise.le. UsageOfRuntime. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
@interface ViewController ()

@property (strong, nonatomic) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.person = [Person new];
    self.person.age = 21;
    //此行注册监听后，利用Runtime在程序运行过程中，改变了这个对象的类型：NSKVONotifing_Person
    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
}
- (IBAction)allIvar:(id)sender {
    
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i++) {
        //拿出属性的名称
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * KEY = [NSString stringWithUTF8String:name];
        NSLog(@"name -----> %@", KEY);
    }
    
    //c语言里面需要释放指针!!
    free(ivars);
    
}

- (IBAction)allMethod:(UIButton *)sender {
    
    // 定义变量
    unsigned int count;
    // 运行时获取私有方法列表
    Method *methods = class_copyMethodList([Person class], &count);
    
    for (int index = 0; index < count; ++index) {
        Method method = methods[index];
        
        // 这步完了之后, 可以获取到方法的地址
        SEL selector = method_getName(method);
        
        NSString *name = NSStringFromSelector(selector);
        // 确定方法类型
        const char *type = method_getTypeEncoding(method);
        NSLog(@"fun-----%@,  type-----> %s",name,type);
    }
    free(methods);
}
- (IBAction)allProperty:(id)sender {
    
    // 定义变量
    unsigned int count;
    // 运行时获取私有属性列表
    objc_property_t *properties = class_copyPropertyList([Person class], &count);

    for (int index = 0; index < count; ++index) {
        // 声明属性
        objc_property_t property = properties[index];

        // 指针数组. 通过property_getName获取属性的名称
        const char *cName = property_getName(property);
        // UTF8转码
        NSString *name = [NSString stringWithUTF8String:cName];
        NSLog(@"name -----> %@", name);
    }
    
    free(properties);
}
- (IBAction)KVO:(id)sender {
    
    
    self.person.age = 22;
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@监听到%@属性的改变为%@",object,keyPath,change);
}

@end
