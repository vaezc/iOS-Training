//
//	Subject.h

//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "Cast.h"
#import "Cast.h"
#import "Avatar.h"
#import "Rating.h"

@interface Subject : NSObject

@property (nonatomic, strong) NSString * alt;
@property (nonatomic, strong) NSArray * casts;
@property (nonatomic, assign) NSInteger collectCount;
@property (nonatomic, strong) NSArray * directors;
@property (nonatomic, strong) NSArray * genres;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) Avatar * images;
@property (nonatomic, strong) NSString * originalTitle;
@property (nonatomic, strong) Rating * rating;
@property (nonatomic, strong) NSString * subtype;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * year;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
