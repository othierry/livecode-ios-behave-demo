//
//  Behave.h
//  HelloBehave
//
//  Created by Olivier THIERRY on 9/30/13.
//  Copyright (c) 2013 behave.io. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BHLeaderboardResults.h"
#import "BHLeaderboardScore.h"
#import "BHPlayer.h"
#import "BHBadge.h"
#import "BHLevel.h"

// UI
#import "BHBadgeViewController.h"
#import "BHBadgesViewController.h"
#import "BHBadgeUnlockViewController.h"
#import "BHPopupPresenter.h"

extern NSString *const BHBadgeUnlockedNotificationName;
extern NSString *const BHPointsEarnedNotificationName;
extern NSString *const BHLevelUpNotificationName;

@protocol BehaveDelegate <NSObject>

@optional

- (void)player:(BHPlayer*)player didUnlockBadge:(BHBadge*)badge;
- (void)player:(BHPlayer*)player didEarnPoints:(NSUInteger)points;
- (void)player:(BHPlayer*)player didLevelUp:(BHLevel*)level;

@end

@interface Behave : NSObject

// Singleton Impl.
+ (Behave*) sharedInstance;
+ (Behave*) sharedInstanceWithToken:(NSString*)token;

+ (NSBundle*) bundle;

// Global Conf.
- (void) registerSuperContext:(NSDictionary*)superContext;

// Player.
- (void) identify:(NSString*)userDistinctId;
- (void) identify:(NSString*)userDistinctId traits:(NSDictionary*)traits;

// Behaviours
- (void) track:(NSString*)behavior;
- (void) track:(NSString*)behavior context:(NSDictionary*)context;

// Leaderboards
- (void) fetchResultsForLeaderboard:(NSString*)leaderboardId
                         completion:(void(^)(BHLeaderboardResults *results))completionBLock;

- (void) fetchResultsForLeaderboard:(NSString*)leaderboardId
                            options:(NSDictionary*)options
                         completion:(void(^)(BHLeaderboardResults *results))completionBLock;

- (void) fetchResultsForLeaderboard:(NSString*)leaderboardId
                            options:(NSDictionary*)options
                              scope:(BHLeaderboardResultsScope)scope
                         completion:(void(^)(BHLeaderboardResults *results))completionBLock;

// Badges
- (void) fetchPlayerBadgesWithCompletion:(void(^)(NSArray *badges))completionBlock;
- (void) fetchLockedBadgesWithCompletion:(void(^)(NSArray *badges))completionBlock;

@property (nonatomic, strong) BHPlayer           *player;

@property (weak)              id<BehaveDelegate> delegate;

@end
