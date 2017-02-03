//
//  SMBMoviesController.m
//  MovieSearch
//
//  Created by Ilias Basha on 2/3/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import "SMBMoviesController.h"
#import "SMBNetworkController.h"
#import "SMBMovies.h"
#import "MovieSearch-Swift.h"

@interface SMBMoviesController ()

@property(nonatomic, strong, readwrite) NSArray *movies;

@end


@implementation SMBMoviesController



-(void)setMovies:(NSArray *)movies
{
    if(movies != _movies)
    {
        _movies = movies;
    }
}


-(void)clearMovies
{
    self.movies = nil;
}


// TODO - return serialized data using fetch request func.

-(void)searchMovies:(NSString *)title
{
    SMBNetworkController *networkController = [SMBNetworkController sharedController];
    [networkController fetchResultsForTitle:title completion:^(NSData *data, NSError *error) {
        if(error)
        {
            NSLog(@"Error fetching search results: %@", error);
            return;
        }
        
        NSError *localError = nil;
        NSArray *results = [self moviesByParsingJSON:data error:&localError];
        
        if(!results)
        {
            NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"Error parsing JSON for search %@: %@", jsonString, error);
        }
        self.movies = results;
    }];
}

-(NSArray *)moviesByParsingJSON:(NSData *)data error:(NSError **)error {
    
    error = error? : &(NSError *__autoreleasing){ nil };
    NSArray *dictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
    if (!dictionaries) {
        return nil; }
    
    NSMutableArray *movies = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        SMBMovies *movie = [[SMBMovies alloc] initWithDicitonary:dictionary];
        if (movie) {
            [movies addObject:movie];
        }
    }
    return movies;
}




@end
