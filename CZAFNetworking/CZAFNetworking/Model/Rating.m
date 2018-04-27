//
//	Rating.m

//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Rating.h"

NSString *const kRatingAverage = @"average";
NSString *const kRatingMax = @"max";
NSString *const kRatingMin = @"min";
NSString *const kRatingStars = @"stars";

@interface Rating ()
@end
@implementation Rating




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kRatingAverage] isKindOfClass:[NSNull class]]){
		self.average = [dictionary[kRatingAverage] floatValue];
	}

	if(![dictionary[kRatingMax] isKindOfClass:[NSNull class]]){
		self.max = [dictionary[kRatingMax] integerValue];
	}

	if(![dictionary[kRatingMin] isKindOfClass:[NSNull class]]){
		self.min = [dictionary[kRatingMin] integerValue];
	}

	if(![dictionary[kRatingStars] isKindOfClass:[NSNull class]]){
		self.stars = dictionary[kRatingStars];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kRatingAverage] = @(self.average);
	dictionary[kRatingMax] = @(self.max);
	dictionary[kRatingMin] = @(self.min);
	if(self.stars != nil){
		dictionary[kRatingStars] = self.stars;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:@(self.average) forKey:kRatingAverage];	[aCoder encodeObject:@(self.max) forKey:kRatingMax];	[aCoder encodeObject:@(self.min) forKey:kRatingMin];	if(self.stars != nil){
		[aCoder encodeObject:self.stars forKey:kRatingStars];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.average = [[aDecoder decodeObjectForKey:kRatingAverage] floatValue];
	self.max = [[aDecoder decodeObjectForKey:kRatingMax] integerValue];
	self.min = [[aDecoder decodeObjectForKey:kRatingMin] integerValue];
	self.stars = [aDecoder decodeObjectForKey:kRatingStars];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Rating *copy = [Rating new];

	copy.average = self.average;
	copy.max = self.max;
	copy.min = self.min;
	copy.stars = [self.stars copy];

	return copy;
}
@end
