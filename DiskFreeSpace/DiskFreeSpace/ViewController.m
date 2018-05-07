//
//  ViewController.m
//  DiskFreeSpace
//
//  Created by vae on 2018/5/7.
//  Copyright © 2018年 周畅. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	int64_t value = DiskSpaceFree();
	NSLog(@"allow use size = %f kb",value / 1000.0);
	NSLog(@"allow use size = %f MB",value / 1000.0 / 1000.0);
	NSLog(@"allow use size = %f G",value / 1000.0 / 1000.0 / 1000.0);
	
	
	
}

static int64_t DiskSpaceFree(){
	NSURL *fileUrl = [NSURL fileURLWithPath:NSHomeDirectory()];
	
	if (@available(iOS 11.0, *)) {
		NSDictionary *spaceDict = [fileUrl resourceValuesForKeys:@[NSURLVolumeAvailableCapacityForImportantUsageKey] error:nil];
		return [spaceDict[NSURLVolumeAvailableCapacityForImportantUsageKey] longLongValue];
	} else {
		NSError *error = nil;
		NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
		if (error)  {
			return -1;
		}
		int64_t space = [[attrs objectForKey:NSFileSystemFreeSize] longLongValue];
		if (space < 0) {
			return -1;
			
		}
		return space;
	}
}


@end
