//
//  ViewController.m
//  NavigationBarTrasition
//
//  Created by vae on 2018/4/27.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

#pragma mark - first solve Method
//-(void)viewWillAppear:(BOOL)animated{
//	[super viewWillAppear:animated];
//	[self.navigationController setNavigationBarHidden:YES animated:animated];
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//	[super viewWillDisappear:animated];
//	[self.navigationController setNavigationBarHidden:NO animated:animated];
//}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.navigationController.delegate = self;
	self.navigationController.navigationBar.translucent = false;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	
	segue.destinationViewController.hidesBottomBarWhenPushed = YES;
}

#pragma mark - second solve Method

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
	BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
	[self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];

}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
