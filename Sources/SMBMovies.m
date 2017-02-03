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
    if (self) {
        _title = [title copy];
        _rating = rating;
        _summary = summary;
    }
    return self;
}



@end
