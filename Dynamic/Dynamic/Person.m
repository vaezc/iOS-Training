//
//  Person.m
//  Dynamic
//
//  Created by vae on 2018/5/8.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation Person
+ (BOOL)resolveInstanceMethod:(SEL)sel{
	
	
	
	if (sel == @selector(eat:)) {
		class_addMethod(self, sel, (IMP)aaa, "V@:@");
		return YES;
	}
	return [super resolveInstanceMethod:sel];
}

void eat(id self ,SEL _cmd)
{
	// 实现内容
	NSLog(@"%@的%@方法动态实现了",self,NSStringFromSelector(_cmd));
}

void aaa(id self, SEL _cmd, id num){
	NSLog(@"%@的%@方法动态实现了,参数为%@",self,NSStringFromSelector(_cmd),num);
}
@end
