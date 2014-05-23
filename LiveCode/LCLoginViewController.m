//
//  LCLoginViewController.m
//  LiveCode
//
//  Created by Olivier THIERRY on 19/05/14.
//  Copyright (c) 2014 Behave.io. All rights reserved.
//

#import "LCLoginViewController.h"

#import <FacebookSDK/FacebookSDK.h>

@interface LCLoginViewController () <FBLoginViewDelegate>

@end

@implementation LCLoginViewController

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    // Identify the player
    [[Behave sharedInstance] identify:user.id traits:@{
        @"name": [user first_name],
        @"picture": [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", user.id]
    }];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
