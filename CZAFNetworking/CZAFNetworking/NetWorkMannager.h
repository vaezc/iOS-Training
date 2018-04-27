//
//  NetWorkMannager.h
//  CZAFNetworking
//
//  Created by vae on 2018/4/20.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^success)(id response);

@interface NetWorkMannager : NSObject
+(NSURLSessionDataTask *)GetRequestUrl:(NSString *)url parameter:(NSString *)parameter Success:(success )su;

@end
