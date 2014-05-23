//
//  BHLeaderboardResults.h
//  HelloBehave
//
//  Created by Olivier THIERRY on 15/11/13.
//  Copyright (c) 2013 behave.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BHLeaderboardScore;
@class BHPlayer;

typedef enum BHLeaderboardResultsScope {
    BHLeaderboardResultsScopeGlobal,
    BHLeaderboardResultsScopeFriends
} BHLeaderboardResultsScope;

@interface BHLeaderboardResults : NSObject

@property (nonatomic, strong) NSArray *scores;

- (id)initWithPayload:(NSDictionary*)payload;

- (BHLeaderboardScore*) scoreForPlayer:(BHPlayer*)player;

@end
