//
//  SMBNetworkController.h
//  MovieSearch
//
//  Created by Ilias Basha on 2/3/17.
//  Copyright © 2017 Open Reel Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMBNetworkController : NSObject

+ (SMBNetworkController *)sharedController;

-(void)fetchResultsForTitle:(NSString *)title completion:(void(^)(NSData *data, NSError *error))completion;



@end
