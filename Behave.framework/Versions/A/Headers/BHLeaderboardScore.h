//
//  BHLeaderboardScore.h
//  HelloBehave
//
//  Created by Olivier THIERRY on 15/11/13.
//  Copyright (c) 2013 behave.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BHPlayer;

@interface BHLeaderboardScore : NSObject

- (id)initWithPayload:(NSDictionary*)payload;

@property (nonatomic) NSUInteger            position;
@property (nonatomic) NSUInteger            score;
@property (nonatomic, strong) BHPlayer *player;

@end
