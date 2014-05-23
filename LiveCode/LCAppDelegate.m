//
//  LCAppDelegate.m
//  LiveCode
//
//  Created by Olivier THIERRY on 16/05/14.
//  Copyright (c) 2014 Behave.io. All rights reserved.
//

#import "LCAppDelegate.h"

#import <FacebookSDK/FacebookSDK.h>
#import <MBProgressHUD/MBProgressHUD.h>

@implementation LCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeAppearance:application];
    
    // Initialize Behave
    [Behave sharedInstanceWithToken:@"REPLACE_WITH_YOUR_API_TOKEN"];
    [Behave.sharedInstance setDelegate:self];
    
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
    // Display HUD while pre-loading Badge's image for better UX in case of low-connection
    [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [badge setIcon:[UIImage imageWithData:[NSData dataWithContentsOfURL:badge.iconURL]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Hide HUD
            [MBProgressHUD hideAllHUDsForView:self.window animated:YES];
            
            // Display UI for badge unlock
            BHBadgeUnlockViewController *badgeUnlockViewController = [[BHBadgeUnlockViewController alloc] initWithBadge:badge];
            
            [BHPopupPresenter presentPopupController:badgeUnlockViewController fromView:self.window];
        });
    });
}

@end
