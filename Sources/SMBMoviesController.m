//
//  SMBMoviesController.m
//  MovieSearch
//
//  Created by Ilias Basha on 2/3/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import "SMBMoviesController.h"

@implementation SMBMoviesController

+(SMBMoviesController *)sharedController
{
    static SMBMoviesController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[SMBMoviesController alloc] init];
    });
    return sharedController;
}







@end
