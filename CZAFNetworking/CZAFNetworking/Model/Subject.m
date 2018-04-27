//
//	Subject.m

//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Subject.h"

NSString *const kSubjectAlt = @"alt";
NSString *const kSubjectCasts = @"casts";
NSString *const kSubjectCollectCount = @"collect_count";
NSString *const kSubjectDirectors = @"directors";
NSString *const kSubjectGenres = @"genres";
NSString *const kSubjectIdField = @"id";
NSString *const kSubjectImages = @"images";
NSString *const kSubjectOriginalTitle = @"original_title";
NSString *const kSubjectRating = @"rating";
NSString *const kSubjectSubtype = @"subtype";
NSString *const kSubjectTitle = @"title";
NSString *const kSubjectYear = @"year";

@interface Subject ()
@end
@implementation Subject




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSubjectAlt] isKindOfClass:[NSNull class]]){
		self.alt = dictionary[kSubjectAlt];
	}	
	if(dictionary[kSubjectCasts] != nil && [dictionary[kSubjectCasts] isKindOfClass:[NSArray class]]){
		NSArray * castsDictionaries = dictionary[kSubjectCasts];
		NSMutableArray * castsItems = [NSMutableArray array];
		for(NSDictionary * castsDictionary in castsDictionaries){
			Cast * castsItem = [[Cast alloc] initWithDictionary:castsDictionary];
			[castsItems addObject:castsItem];
		}
		self.casts = castsItems;
	}
	if(![dictionary[kSubjectCollectCount] isKindOfClass:[NSNull class]]){
		self.collectCount = [dictionary[kSubjectCollectCount] integerValue];
	}

	if(dictionary[kSubjectDirectors] != nil && [dictionary[kSubjectDirectors] isKindOfClass:[NSArray class]]){
		NSArray * directorsDictionaries = dictionary[kSubjectDirectors];
		NSMutableArray * directorsItems = [NSMutableArray array];
		for(NSDictionary * directorsDictionary in directorsDictionaries){
			Cast * directorsItem = [[Cast alloc] initWithDictionary:directorsDictionary];
			[directorsItems addObject:directorsItem];
		}
		self.directors = directorsItems;
	}
	if(![dictionary[kSubjectGenres] isKindOfClass:[NSNull class]]){
		self.genres = dictionary[kSubjectGenres];
	}	
	if(![dictionary[kSubjectIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kSubjectIdField];
	}	
	if(![dictionary[kSubjectImages] isKindOfClass:[NSNull class]]){
		self.images = [[Avatar alloc] initWithDictionary:dictionary[kSubjectImages]];
	}

	if(![dictionary[kSubjectOriginalTitle] isKindOfClass:[NSNull class]]){
		self.originalTitle = dictionary[kSubjectOriginalTitle];
	}	
	if(![dictionary[kSubjectRating] isKindOfClass:[NSNull class]]){
		self.rating = [[Rating alloc] initWithDictionary:dictionary[kSubjectRating]];
	}

	if(![dictionary[kSubjectSubtype] isKindOfClass:[NSNull class]]){
		self.subtype = dictionary[kSubjectSubtype];
	}	
	if(![dictionary[kSubjectTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kSubjectTitle];
	}	
	if(![dictionary[kSubjectYear] isKindOfClass:[NSNull class]]){
		self.year = dictionary[kSubjectYear];
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
		dictionary[kSubjectAlt] = self.alt;
	}
	if(self.casts != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Cast * castsElement in self.casts){
			[dictionaryElements addObject:[castsElement toDictionary]];
		}
		dictionary[kSubjectCasts] = dictionaryElements;
	}
	dictionary[kSubjectCollectCount] = @(self.collectCount);
	if(self.directors != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Cast * directorsElement in self.directors){
			[dictionaryElements addObject:[directorsElement toDictionary]];
		}
		dictionary[kSubjectDirectors] = dictionaryElements;
	}
	if(self.genres != nil){
		dictionary[kSubjectGenres] = self.genres;
	}
	if(self.idField != nil){
		dictionary[kSubjectIdField] = self.idField;
	}
	if(self.images != nil){
		dictionary[kSubjectImages] = [self.images toDictionary];
	}
	if(self.originalTitle != nil){
		dictionary[kSubjectOriginalTitle] = self.originalTitle;
	}
	if(self.rating != nil){
		dictionary[kSubjectRating] = [self.rating toDictionary];
	}
	if(self.subtype != nil){
		dictionary[kSubjectSubtype] = self.subtype;
	}
	if(self.title != nil){
		dictionary[kSubjectTitle] = self.title;
	}
	if(self.year != nil){
		dictionary[kSubjectYear] = self.year;
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
		[aCoder encodeObject:self.alt forKey:kSubjectAlt];
	}
	if(self.casts != nil){
		[aCoder encodeObject:self.casts forKey:kSubjectCasts];
	}
	[aCoder encodeObject:@(self.collectCount) forKey:kSubjectCollectCount];	if(self.directors != nil){
		[aCoder encodeObject:self.directors forKey:kSubjectDirectors];
	}
	if(self.genres != nil){
		[aCoder encodeObject:self.genres forKey:kSubjectGenres];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kSubjectIdField];
	}
	if(self.images != nil){
		[aCoder encodeObject:self.images forKey:kSubjectImages];
	}
	if(self.originalTitle != nil){
		[aCoder encodeObject:self.originalTitle forKey:kSubjectOriginalTitle];
	}
	if(self.rating != nil){
		[aCoder encodeObject:self.rating forKey:kSubjectRating];
	}
	if(self.subtype != nil){
		[aCoder encodeObject:self.subtype forKey:kSubjectSubtype];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kSubjectTitle];
	}
	if(self.year != nil){
		[aCoder encodeObject:self.year forKey:kSubjectYear];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.alt = [aDecoder decodeObjectForKey:kSubjectAlt];
	self.casts = [aDecoder decodeObjectForKey:kSubjectCasts];
	self.collectCount = [[aDecoder decodeObjectForKey:kSubjectCollectCount] integerValue];
	self.directors = [aDecoder decodeObjectForKey:kSubjectDirectors];
	self.genres = [aDecoder decodeObjectForKey:kSubjectGenres];
	self.idField = [aDecoder decodeObjectForKey:kSubjectIdField];
	self.images = [aDecoder decodeObjectForKey:kSubjectImages];
	self.originalTitle = [aDecoder decodeObjectForKey:kSubjectOriginalTitle];
	self.rating = [aDecoder decodeObjectForKey:kSubjectRating];
	self.subtype = [aDecoder decodeObjectForKey:kSubjectSubtype];
	self.title = [aDecoder decodeObjectForKey:kSubjectTitle];
	self.year = [aDecoder decodeObjectForKey:kSubjectYear];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Subject *copy = [Subject new];

	copy.alt = [self.alt copy];
	copy.casts = [self.casts copy];
	copy.collectCount = self.collectCount;
	copy.directors = [self.directors copy];
	copy.genres = [self.genres copy];
	copy.idField = [self.idField copy];
	copy.images = [self.images copy];
	copy.originalTitle = [self.originalTitle copy];
	copy.rating = [self.rating copy];
	copy.subtype = [self.subtype copy];
	copy.title = [self.title copy];
	copy.year = [self.year copy];

	return copy;
}
@end
