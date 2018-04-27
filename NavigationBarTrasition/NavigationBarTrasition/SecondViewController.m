//
//  SecondViewController.m
//  NavigationBarTrasition
//
//  Created by vae on 2018/4/27.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "SecondViewController.h"
#import "TestViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)pushViewController:(id)sender {
	TestViewController *testViewController = [[TestViewController alloc] init];
	[self.navigationController pushViewController:testViewController animated:YES];
}



@end
