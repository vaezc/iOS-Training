//
//  ViewController.m
//  MethodSwizzling
//
//  Created by vae on 2018/3/29.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Student.h"
#import "Student+hook.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	Student *student = [[Student alloc] init];
	[student eat];
	[student xxx_eat];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}


@end
