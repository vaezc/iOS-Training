//
//	Cast.m

//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Cast.h"

NSString *const kCastAlt = @"alt";
NSString *const kCastAvatars = @"avatars";
NSString *const kCastIdField = @"id";
NSString *const kCastName = @"name";

@interface Cast ()
@end
@implementation Cast




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCastAlt] isKindOfClass:[NSNull class]]){
		self.alt = dictionary[kCastAlt];
	}	
	if(![dictionary[kCastAvatars] isKindOfClass:[NSNull class]]){
		self.avatars = [[Avatar alloc] initWithDictionary:dictionary[kCastAvatars]];
	}

	if(![dictionary[kCastIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCastIdField];
	}	
	if(![dictionary[kCastName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kCastName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.alt != nil){
		dictionary[kCastAlt] = self.alt;
	}
	if(self.avatars != nil){
		dictionary[kCastAvatars] = [self.avatars toDictionary];
	}
	if(self.idField != nil){
		dictionary[kCastIdField] = self.idField;
	}
	if(self.name != nil){
		dictionary[kCastName] = self.name;
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
	if(self.alt != nil){
		[aCoder encodeObject:self.alt forKey:kCastAlt];
	}
	if(self.avatars != nil){
		[aCoder encodeObject:self.avatars forKey:kCastAvatars];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kCastIdField];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kCastName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.alt = [aDecoder decodeObjectForKey:kCastAlt];
	self.avatars = [aDecoder decodeObjectForKey:kCastAvatars];
	self.idField = [aDecoder decodeObjectForKey:kCastIdField];
	self.name = [aDecoder decodeObjectForKey:kCastName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Cast *copy = [Cast new];

	copy.alt = [self.alt copy];
	copy.avatars = [self.avatars copy];
	copy.idField = [self.idField copy];
	copy.name = [self.name copy];

	return copy;
}
@end
