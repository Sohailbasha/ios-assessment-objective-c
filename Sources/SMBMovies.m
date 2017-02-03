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
    NSString *title = dictionary[@"title"];
    NSInteger rating = [dictionary[@"vote_average"] integerValue];
    NSString *summary = dictionary[@"overview"];
    
    if(![title isKindOfClass:[NSString class]])
    {
        return nil;
    }
    
    return [self initWithTitle:title rating:rating summary:summary];
}
@end
