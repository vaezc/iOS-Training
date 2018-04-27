//
//	Movie.m

//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Movie.h"

NSString *const kMovieCount = @"count";
NSString *const kMovieStart = @"start";
NSString *const kMovieSubjects = @"subjects";
NSString *const kMovieTitle = @"title";
NSString *const kMovieTotal = @"total";

@interface Movie ()
@end
@implementation Movie




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMovieCount] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[kMovieCount] integerValue];
	}

	if(![dictionary[kMovieStart] isKindOfClass:[NSNull class]]){
		self.start = [dictionary[kMovieStart] integerValue];
	}

	if(dictionary[kMovieSubjects] != nil && [dictionary[kMovieSubjects] isKindOfClass:[NSArray class]]){
		NSArray * subjectsDictionaries = dictionary[kMovieSubjects];
		NSMutableArray * subjectsItems = [NSMutableArray array];
		for(NSDictionary * subjectsDictionary in subjectsDictionaries){
			Subject * subjectsItem = [[Subject alloc] initWithDictionary:subjectsDictionary];
			[subjectsItems addObject:subjectsItem];
		}
		self.subjects = subjectsItems;
	}
	if(![dictionary[kMovieTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kMovieTitle];
	}	
	if(![dictionary[kMovieTotal] isKindOfClass:[NSNull class]]){
		self.total = [dictionary[kMovieTotal] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kMovieCount] = @(self.count);
	dictionary[kMovieStart] = @(self.start);
	if(self.subjects != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Subject * subjectsElement in self.subjects){
			[dictionaryElements addObject:[subjectsElement toDictionary]];
		}
		dictionary[kMovieSubjects] = dictionaryElements;
	}
	if(self.title != nil){
		dictionary[kMovieTitle] = self.title;
	}
	dictionary[kMovieTotal] = @(self.total);
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
	[aCoder encodeObject:@(self.count) forKey:kMovieCount];	[aCoder encodeObject:@(self.start) forKey:kMovieStart];	if(self.subjects != nil){
		[aCoder encodeObject:self.subjects forKey:kMovieSubjects];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kMovieTitle];
	}
	[aCoder encodeObject:@(self.total) forKey:kMovieTotal];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.count = [[aDecoder decodeObjectForKey:kMovieCount] integerValue];
	self.start = [[aDecoder decodeObjectForKey:kMovieStart] integerValue];
	self.subjects = [aDecoder decodeObjectForKey:kMovieSubjects];
	self.title = [aDecoder decodeObjectForKey:kMovieTitle];
	self.total = [[aDecoder decodeObjectForKey:kMovieTotal] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Movie *copy = [Movie new];

	copy.count = self.count;
	copy.start = self.start;
	copy.subjects = [self.subjects copy];
	copy.title = [self.title copy];
	copy.total = self.total;

	return copy;
}
@end
