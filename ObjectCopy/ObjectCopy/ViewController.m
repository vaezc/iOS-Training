//
//  ViewController.m
//  ObjectCopy
//
//  Created by vae on 2018/5/10.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	//非容器对象分析
	
	//重新创建了对象，地址不同，内容相同
	NSString *str = @"vae";
	NSMutableString *copyString = [str mutableCopy];
	NSLog(@"str = %@, copyString = %@",str,copyString);
	NSLog(@"str = %p, copyString = %p",str,copyString);
	
	NSMutableString *str2 = [NSMutableString stringWithFormat:@"vae"];
	NSMutableString *copyString2 = [str2 mutableCopy];
	[str2 appendString:@"test"];
	NSLog(@"str2 = %@, copString2 = %@",str2,copyString2);
	NSLog(@"str2 = %p, copString2 = %p",str2,copyString2);

	
	NSMutableString *str3 = [NSMutableString stringWithFormat:@"vae"];
	NSString *copyString3 = [str3 copy];
	[str3 appendString:@"test"];
	NSLog(@"str3 = %@, copString3 = %@",str3,copyString3);
	NSLog(@"str3 = %p, copString3 = %p",str3,copyString3);
	
	//因为NSString 为不可变类型，拷贝出来的对象也是不能修改。既然两个对象都不能修改，所以永不能影响到另外一个对象，已经符合拷贝的目的。oc为了对内存的节省，进行了优化所以就不会生成一个新的对象了。
	NSString *str4 = @"vae";
	NSString *copyString4 = [str4 copy];
	NSLog(@"str4 = %@, copString4 = %@",str4,copyString4);
	NSLog(@"str4 = %p, copString4 = %p",str3,copyString4);

	//容器对象分析
   /*
	如果对一不可变对象复制，copy是指针复制（浅拷贝）、mutableCopy就是对象复制（深拷贝）。
	如果是对可变对象复制，都是深拷贝，但是copy返回的对象是不可变的。
	*/
	
	//array 不可变 copy之后返回的是同一个对象 浅赋值 mutableCopy 深复制
	NSArray *array = @[@"a",@"b",@"c"];
	NSArray *copyArray = [array copy];
	NSMutableArray *arrayMutableCopy = [array mutableCopy];
	NSLog(@"array = %@, copyArray = %@, arrayMutableCopy = %@",array,copyArray,arrayMutableCopy);
		NSLog(@"array = %p, copyArray = %p, arrayMutableCopy = %p",array,copyArray,arrayMutableCopy);
	
	//array2 可变 copy之后返回新对象 是深复制
	NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"a",@"b", nil];
	NSMutableArray *copyArray2 = [array2 copy];
	NSMutableArray *arrayMutableCopy2 = [array2 mutableCopy];
	NSLog(@"array2 = %@, copyArray2 = %@, arrayMutableCopy2 = %@",array2,copyArray2,arrayMutableCopy2);
	NSLog(@"array2 = %p, copyArray2 = %p, arrayMutableCopy2 = %p",array2,copyArray2,arrayMutableCopy2);

	
	//对于容器来说，其元素对象始终是指针复制，也就是浅复制。这样我们修改一个容器中的对象，就会影响到其他拷贝的容器中的对象，
	NSArray *array3 = @[[NSMutableString stringWithFormat:@"vae"],@"b",@"c"];
	NSArray *copyArray3 = [array3 copy];
	NSMutableArray *arrayMutableCopyArray = [array3 mutableCopy];
	NSMutableString *testString = array3[0];
	[testString appendString:@"test"];
	NSLog(@"array3 = %@, copyArray3 = %@, arrayMutableCopyArray = %@",array3,copyArray3,arrayMutableCopyArray);
	
	/*
	 如果没有生成新的对象, 我们称之为浅拷贝, 本质就是指针拷贝
	 如果生成了新的对象, 我们称之为深拷贝, 本质就是会创建一个新的对象
	 最后：最重要的还是记住拷贝的目的，这样理解深浅拷贝都会变得非常简单，改变原来的内容不影响副本，改变副本也不影响原来的内容
	 */
	
	
	/*
	 block 使用copy关键字
	 首先这涉及到MRC时代。因为MRC时期，为了防止block内用到的变量提前释放导致程序崩溃，使用copy将block存放到堆中，此时block会对内部变量进行一次retain操作，从而防止意外清空。同时block放入堆中也会带来一个新的问题，self持有block的引用，如果在block中使用self就会产生循环引用，所以不论MRC还是ARC，我们都分别用blcok和weak来修饰self。
	 
	 ARC时代用strong 和 copy都可以，因为同样可以防止内容提前释放。
	 */
}




@end
