//
//  ViewController.m
//  CZAFNetworking
//
//  Created by vae on 2018/4/20.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "NetWorkMannager.h"
#import "Movie.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[NetWorkMannager GetRequestUrl:@"http://api.douban.com/v2/movie/top250" parameter:nil Success:^(NSDictionary *response) {
		
		Movie *movie = [[Movie alloc] initWithDictionary:response];
		NSArray *array = movie.subjects;
		for (Subject *subject in array) {
			NSLog(@"%@",subject.title);
		}
		
	}];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
