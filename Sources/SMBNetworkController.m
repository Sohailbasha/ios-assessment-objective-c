//
//  SMBNetworkController.m
//  MovieSearch
//
//  Created by Ilias Basha on 2/3/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import "SMBNetworkController.h"

@implementation SMBNetworkController

+(SMBNetworkController *)sharedController
{
    static SMBNetworkController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[SMBNetworkController alloc] init];
    });
    return sharedController;
}

+(NSString *) apiKey
{
    static NSString *apiKey = @"4b35e2b5f7b946db32f14397a39e6bf0";
    return apiKey;
}

+(NSURL *) baseURL
{
    return [NSURL URLWithString:@"https://api.themoviedb.org/3"];
}

-(NSURL *) apiForMovie:(NSString *)title {
    NSURLComponents *components = [NSURLComponents componentsWithURL:[[self class] baseURL] resolvingAgainstBaseURL:YES];
    components.path = @"/search/movie";
    NSURLQueryItem *apiKey = [NSURLQueryItem queryItemWithName:@"api_key" value:[[self class] apiKey]];
    NSURLQueryItem *query = [NSURLQueryItem queryItemWithName:@"query" value:[title lowercaseString]];
    
    components.queryItems = @[apiKey, query];
    return components.URL;
}

// TODO - Create fetch request
-(void)fetchResultsForTitle:(NSString *)title completion:(void(^)(NSData *data, NSError *error))completion;
{
    NSURL *searchURL = [self apiForMovie:title];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion(data, error);
    }];
    
    [task resume];
}




@end
