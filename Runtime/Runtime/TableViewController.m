//
//  TableViewController.m
//  Runtime
//
//  Created by vae on 2018/5/11.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "TableViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.row == 0) {
		[self ClassInfo];
	}
	if (indexPath.row == 1) {
		
	}
}

#pragma mark - 对象结构
/*
 struct objc_class {
 Class _Nonnull isa  OBJC_ISA_AVAILABILITY; // isa指针，指向类，对象指向类，类对象指向元类，元类指向根元类。
 
 Class _Nullable super_class   				//父类
 const char * _Nonnull name    				//名称
 long version                  				//版本号  version：我们可以使用这个字段来提供类的版本信息。这对于对象的序列化非常有用，它														可是让我们识别出不同类定义版本中实例变量布局的改变。
 long info                     				//信息
 long instance_size                  		//实例大小
 struct objc_ivar_list * _Nullable ivars      //成员列表
 struct objc_method_list * _Nullable * _Nullable methodLists //方法列表
 struct objc_cache * _Nonnull cache             //缓存列表
 struct objc_protocol_list * _Nullable protocols     //协议列表
 }
 */
-(void)ClassInfo{
	Class class = [self class];
	NSLog(@"%@",NSStringFromClass(class));
	
	//superClass
	NSLog(@"%@",NSStringFromClass([class superclass]));
	
	
	//instance
	long size =   sizeof(class);
	NSLog(@"size = %ld",size);
	
	/*
	struct objc_ivar {
	 char * _Nullable ivar_name;
	 char * _Nullable ivar_type;
	 int ivar_offset;
	 int space;
	}
	 */

	//ivars
	unsigned int outCount = 0;
	Ivar *ivarList =  class_copyIvarList(class, &outCount);
	for (int i = 0; i < outCount; i++) {
		Ivar ivar = ivarList[i];
		const char *name =  ivar_getName(ivar);
		printf("ivarName = %s\n",name);
	}
	printf("\n================================\n");
	
/*
struct objc_method {
 	SEL _Nonnull method_name ;
 	char * _Nullable method_types ;
 	IMP _Nonnull method_imp   ;
}
 */
	//MethodList
	unsigned int Count = 0;
	Method *methodList  =  class_copyMethodList(class, &Count);
	for (int i = 0; i < Count; i++) {
		Method method = methodList[i];
		SEL  sel =  method_getName(method);
		const char *name = sel_getName(sel);
		printf("method name = %s\n",name);
	}
	printf("\n================================\n");
	
	
	//PropertyList
	unsigned int propertyCount = 0;
	objc_property_t *properyList =  class_copyPropertyList(class, &propertyCount);
	for (int i = 0 ; i < propertyCount; i++) {
		objc_property_t property = properyList[i];
		const char *propertyName =   property_getName(property);
		printf("propertyName = %s\n",propertyName);
	}
	printf("\n================================\n");
	
	//protocolList
	unsigned int protocolCount = 0;
	Protocol * __unsafe_unretained _Nonnull * _Nullable protocolList =    class_copyProtocolList([class superclass], &protocolCount);
	for (int i = 0; i < protocolCount; i++) {
		Protocol *protocol = protocolList[i];
		const char * name =   protocol_getName(protocol);
		printf("protocol name = %s",name);
	}
	printf("\n================================\n");
	
	//缓存调用
	/*
	 当某个类调用一个方法时，runtime会把这个方法加入到缓存中去，这个缓存列表存储最近调用的方法，如果说每次调用方法时都从methodlist中去遍历的话，
	 势必性能比较差，一般都是先从缓存list中去寻找方法的实现，如果缓存中没有的话就从methodlist中去寻找方法
	 */
}

#pragma mark - 分类结构
/*
struct objc_category {
	char * _Nonnull category_name                            OBJC2_UNAVAILABLE;
	char * _Nonnull class_name                               OBJC2_UNAVAILABLE;
	struct objc_method_list * _Nullable instance_methods     OBJC2_UNAVAILABLE;
	struct objc_method_list * _Nullable class_methods        OBJC2_UNAVAILABLE;
	struct objc_protocol_list * _Nullable protocols          OBJC2_UNAVAILABLE;
}                                                            OBJC2_UNAVAILABLE;
*/







@end
