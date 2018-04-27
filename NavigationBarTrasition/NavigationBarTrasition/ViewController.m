//
//  ViewController.m
//  NavigationBarTrasition
//
//  Created by vae on 2018/4/27.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "BarStyleTableViewCell.h"
@interface ViewController ()<UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSourceArray;
@property (nonatomic, assign) BOOL barHidden;
@property (nonatomic, assign) BOOL transparent;
@property (nonatomic, assign) BOOL translucent;
@property (nonatomic, assign) UIBarStyle barstyle;
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



#pragma mark -lifeCycle

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
//	self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
//	self.navigationController.navigationBar.hidden = NO;
//	self.navigationController.navigationBar.translucent = NO;
//	self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.navigationController.delegate = self;
	[self loadSubViews];
}

-(void)loadSubViews{
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	self.tableView.tableFooterView = [UIView new];
	//去掉导航栏下方的线
	[self.navigationController.navigationBar setShadowImage:[UIImage new]];
//	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefaultPrompt];
}


- (IBAction)pushNextViewController:(id)sender {
	SecondViewController *secondViewController = [[SecondViewController alloc] init];
	self.navigationController.navigationBar.translucent = self.translucent;
	self.navigationController.navigationBar.hidden = self.barHidden;
	self.navigationController.navigationBar.barStyle = self.barstyle;
	[self.navigationController pushViewController:secondViewController animated:YES];
}

#pragma mark -Actions
-(void)switchValueChaned:(UISwitch *)sender{
	NSInteger const tag = sender.tag;
	if (tag == 0) {
		_barHidden = sender.isOn;
	}else if (tag == 1){
		_transparent = sender.isOn;
	}else if (tag == 2){
		_translucent = sender.isOn;
	}else{
		_barstyle = sender.isOn ? UIBarStyleBlack : UIBarStyleDefault;
	}
}

#pragma mark - UINavigationBarDelegate
///second solve Method

//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//	BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
//	[self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
//}

#pragma mark - tableview DataSource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	if (section == 0) {
		return @"Next Controller BarStyle";
	}else if(section == 1){
		return @"Next Controller BarColor";
	}
	return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return self.dataSourceArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [self.dataSourceArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSInteger const section = indexPath.section;
	NSInteger const row     = indexPath.row;
	
	if (section ==0) {
		BarStyleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([BarStyleTableViewCell class])];

		if (!cell) {
			cell = [[BarStyleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([BarStyleTableViewCell class])];
			cell.textLabel.text = self.dataSourceArray[indexPath.section][indexPath.row];
			BOOL isOn = NO;
			if (row == 0) {
				isOn = self.barHidden;
			}else if (row == 1){
				isOn = self.transparent;
			}else if (row == 2){
				isOn = self.translucent;
			}else if (row == 3){
				isOn = self.barstyle == UIBarStyleBlack;
			}
			cell.switcher.on = isOn;
			cell.switcher.tag = row;
			[cell.switcher addTarget:self action:@selector(switchValueChaned:) forControlEvents:UIControlEventValueChanged];
		}
		return cell;
	}else{
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
		if (!cell) {
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
			cell.textLabel.text = self.dataSourceArray[indexPath.section][indexPath.row];
		}
		return cell;
		
	}
	return nil;
}

#pragma mark - TableviewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	NSInteger const section = indexPath.section;
	NSInteger const row     = indexPath.row;
	UIColor *color;
	if (section == 1) {
		if (row == 0) {
			color = [UIColor redColor];
		}else if (row == 1){
			color = [UIColor orangeColor];
		}else if (row == 2){
			color = [UIColor yellowColor];
		}else if (row == 3){
			color = [UIColor greenColor];
		}else if (row == 4){
			color = [UIColor purpleColor];
		}else if (row == 5){
			color = [UIColor blueColor];
		}else if (row == 6){
			color = [UIColor whiteColor];
		}
		self.navigationController.navigationBar.barTintColor = color;
		[self pushNextViewController:nil];
	}
}

#pragma mark - getter && setter

-(NSArray *)dataSourceArray{
	if (!_dataSourceArray) {
		_dataSourceArray = @[
							 @[@"Hidden",@"Transparent",@"Translucent",@"Black Bar Style"],
							 @[@"red",@"orange",@"yellow",@"green",@"pure",@"blue",@"white"],
							 ];
	}
	return _dataSourceArray;
}


@end
