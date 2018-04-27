//
//	Avatar.m

//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Avatar.h"

NSString *const kAvatarLarge = @"large";
NSString *const kAvatarMedium = @"medium";
NSString *const kAvatarSmall = @"small";

@interface Avatar ()
@end
@implementation Avatar




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAvatarLarge] isKindOfClass:[NSNull class]]){
		self.large = dictionary[kAvatarLarge];
	}	
	if(![dictionary[kAvatarMedium] isKindOfClass:[NSNull class]]){
		self.medium = dictionary[kAvatarMedium];
	}	
	if(![dictionary[kAvatarSmall] isKindOfClass:[NSNull class]]){
		self.small = dictionary[kAvatarSmall];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.large != nil){
		dictionary[kAvatarLarge] = self.large;
	}
	if(self.medium != nil){
		dictionary[kAvatarMedium] = self.medium;
	}
	if(self.small != nil){
		dictionary[kAvatarSmall] = self.small;
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
	if(self.large != nil){
		[aCoder encodeObject:self.large forKey:kAvatarLarge];
	}
	if(self.medium != nil){
		[aCoder encodeObject:self.medium forKey:kAvatarMedium];
	}
	if(self.small != nil){
		[aCoder encodeObject:self.small forKey:kAvatarSmall];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.large = [aDecoder decodeObjectForKey:kAvatarLarge];
	self.medium = [aDecoder decodeObjectForKey:kAvatarMedium];
	self.small = [aDecoder decodeObjectForKey:kAvatarSmall];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Avatar *copy = [Avatar new];

	copy.large = [self.large copy];
	copy.medium = [self.medium copy];
	copy.small = [self.small copy];

	return copy;
}
@end
