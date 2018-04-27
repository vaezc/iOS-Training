//
//	Avatar.h

//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface Avatar : NSObject

@property (nonatomic, strong) NSString * large;
@property (nonatomic, strong) NSString * medium;
@property (nonatomic, strong) NSString * small;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
