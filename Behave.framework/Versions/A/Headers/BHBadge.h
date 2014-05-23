//
//  BHBadge.h
//  HelloBehave
//
//  Created by Olivier THIERRY on 10/1/13.
//  Copyright (c) 2013 behave.io. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BHBadge : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *referenceId;
@property (nonatomic, readonly) NSString *hint;
@property (nonatomic, readonly) NSString *message;
@property (nonatomic, readonly) NSURL    *iconURL;
@property (nonatomic, readonly) NSDictionary *social;
@property (nonatomic, readonly) NSDictionary *localization;

// When owned by a player. this will indicate when unlocked for last time
@property (nonatomic, strong)   NSDate *lastUnlockedAt;

@property (nonatomic, strong)   UIImage  *icon;

- (id) initWithPayload:(NSDictionary*)payload;

@end
