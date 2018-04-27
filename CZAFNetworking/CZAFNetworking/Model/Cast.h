//
//	Cast.h

//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "Avatar.h"

@interface Cast : NSObject

@property (nonatomic, strong) NSString * alt;
@property (nonatomic, strong) Avatar * avatars;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
