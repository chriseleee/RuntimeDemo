//
//  Person.h
//  UsageOfRuntime
//
//  Created by chriseleee on 2018/10/13.
//  Copyright © 2018年 chrise.le. UsageOfRuntime. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject{
    NSString* _name;
}

@property (assign, nonatomic) int age;
-(void)run;
@end

NS_ASSUME_NONNULL_END
