//
//  SMBMovies.h
//  MovieSearch
//
//  Created by Ilias Basha on 2/3/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMBMovies : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly) NSInteger rating;
@property (nonatomic, readonly, copy) NSString *summary;

-(instancetype)initWithTitle:(NSString *)title rating:(NSInteger)rating summary:(NSString *)summary;

@end


@interface SMBMovies (JSONConversion)

-(instancetype)initWithDicitonary:(NSDictionary<NSString *, id>*)dictionary;

@end
