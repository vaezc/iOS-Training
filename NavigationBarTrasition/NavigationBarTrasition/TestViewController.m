//
//  TestViewController.m
//  NavigationBarTrasition
//
//  Created by vae on 2018/4/27.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor orangeColor];
	
	UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 60, 40)];
	[button setTitle:@"psuh " forState:UIControlStateNormal];
	[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[button addTarget:self action:@selector(pushNextViewController) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
}

-(void)pushNextViewController{
	TestViewController *testviewController = [[TestViewController alloc] init];
	[self.navigationController pushViewController:testviewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
