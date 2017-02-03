//
//  SMBMovies.m
//  MovieSearch
//
//  Created by Ilias Basha on 2/3/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import "SMBMovies.h"

@implementation SMBMovies

-(instancetype)init
{
    return [self initWithTitle:@"" rating:0 summary:@""];
}


- (instancetype)initWithTitle:(NSString *)title rating:(NSInteger)rating summary:(NSString *)summary
{
    self = [super init];
    if (self)
    {
        _title = [title copy];
        _rating = rating;
        _summary = summary;
    }
    return self;
}
@end


@implementation SMBMovies (JSONConversion)

-(instancetype)initWithDicitonary:(NSDictionary<NSString *,id> *)dictionary
{
    NSArray *resultsDictionary = dictionary[@"results"];
    NSString *title = [[NSString alloc] init];
    NSString *summary = [[NSString alloc] init];
    NSInteger rating = 0;
    
    if(![resultsDictionary isKindOfClass:[NSArray class]])
    {
        return nil;
    }
    
    for(NSDictionary *dictionary in resultsDictionary)
    {
        title = dictionary[@"title"];
        rating = [dictionary[@"vote_average"] integerValue];
        summary = dictionary[@"overview"];
    }
    
    return [self initWithTitle:title rating:rating summary:summary];
}
@end
