//
//  SMBMoviesController.h
//  MovieSearch
//
//  Created by Ilias Basha on 2/3/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SMBMovies;

@interface SMBMoviesController : NSObject

@property (nonatomic, strong, readonly) NSArray *movies;

-(void)searchMovies:(NSString *)title;
-(void)clearMovies;


@end
