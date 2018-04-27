//
//  NetWorkMannager.m
//  CZAFNetworking
//
//  Created by vae on 2018/4/20.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "NetWorkMannager.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
@implementation NetWorkMannager

+ (NSURLSessionDataTask *)GetRequestUrl:(NSString *)url parameter:(NSString *)parameter Success:(success)su{
	AFHTTPSessionManager *mannager = [AFHTTPSessionManager manager];
	
	mannager.requestSerializer = [AFJSONRequestSerializer serializer];
	mannager.responseSerializer =  [AFJSONResponseSerializer serializer];
	[SVProgressHUD show];
	
	return  [mannager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
		
	} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		[SVProgressHUD dismiss];
		su(responseObject);
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		[SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",error.localizedDescription]];
		NSLog(@"error = %@",error);
	}];
}

@end
