//
//  LCAppDelegate.m
//  LiveCode
//
//  Created by Olivier THIERRY on 16/05/14.
//  Copyright (c) 2014 Behave.io. All rights reserved.
//

#import "LCAppDelegate.h"

#import <FacebookSDK/FacebookSDK.h>

@implementation LCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeAppearance:application];
    
    [Behave sharedInstanceWithToken:@"fa5c816d20620890c5c2227fcced9d1ca03236f0009ba45a66c683ac3957ef10"];
    [[Behave sharedInstance] setDelegate:self];
    
    return YES;
}

- (void)customizeAppearance:(UIApplication*)application
{
    [application setStatusBarStyle:UIStatusBarStyleDefault];

    // Navigation bar title color
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName]];

    // Navigation bar buttons colors
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
}

- (void)player:(BHPlayer *)player didUnlockBadge:(BHBadge *)badge
{
    // Display UI for badge unlock
    BHBadgeUnlockViewController *badgeUnlockViewController = [[BHBadgeUnlockViewController alloc] initWithBadge:badge];
    
    [BHPopupPresenter presentPopupController:badgeUnlockViewController fromView:self.window];
}

@end
