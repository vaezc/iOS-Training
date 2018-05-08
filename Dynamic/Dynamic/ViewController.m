//
//  ViewController.m
//  Dynamic
//
//  Created by vae on 2018/5/8.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	Person *p = [[Person alloc] init];
	[p performSelector:@selector(eat:) withObject:@"vae"];
	
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
	
	NSMethodSignature *myMethodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
	NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:myMethodSignature];
	invocation.target = label;
	invocation.selector = @selector(setText:);
	NSString *text = @"vae";
	[invocation setArgument:&text atIndex:2];
	[invocation retainArguments];
	[invocation invoke];
	NSLog(@"%@",label.text);
	[self.view addSubview:label];
//	invocation.selector = @selector(setText:)
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
