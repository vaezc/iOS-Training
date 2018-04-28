//
//  Student+hook.m
//  MethodSwizzling
//
//  Created by vae on 2018/4/28.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "Student+hook.h"
#import <objc/runtime.h>
@implementation Student (hook)

+(void)load{
	
	/*load方法只会在程序启动时，调用一次，那么我们为什么需要调用dispatch_once_t 呢？
	 这样是保证该方法只会调用一次，因为可能会存在手动去调用load。
	 */
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		SEL originalSelector = @selector(eat);
		SEL swizzleSelector = @selector(xxx_eat);
		
		Method originalMethod = class_getInstanceMethod([self class], originalSelector);
		Method swizzleMethod = class_getInstanceMethod([self class], swizzleSelector);
		
		BOOL isAddSuccess = class_addMethod([self class], originalSelector, class_getMethodImplementation([self class], swizzleSelector), method_getTypeEncoding(swizzleMethod));

/* 这里需要说明两点的是：
1. 为什么需要加上 class_addMethod方法，因为存在这样一种情况，子类的方法其实是从父类继承来的，子类并没有重写。
 所以调用的是父类的方法，这里使用 class_addMethod 方法为子类添加方法，但是imp是swizzle，这样调用子类的方法时调用的是hook的方法。
 直接交换imp指针的话，那么等于将swizzle的方法和父类的方法进行了交换。
2. class_addMethod 已经为子类添加了方法，并将swizzle的imp指针赋值给方法了，调用子类的方法时，实际调用的是swizzle的方法了，这样已经
 达到hook的目的，但是这样还不仅仅满足交换两个指针的目的。所以我们需要将方法的imp指针再赋值给swizzle的方法。这样才是一个完整的交换指针的方法。
*/
		if (isAddSuccess) {
			class_replaceMethod([self class], swizzleSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
		}else{
			method_exchangeImplementations(originalMethod, swizzleMethod);
		}
	});
}

-(void)xxx_eat{

	NSLog(@"hook Function eat");
}

@end
