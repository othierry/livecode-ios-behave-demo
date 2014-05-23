//
//  BHBadgeUnlockViewController.h
//  HelloBehave
//
//  Created by Olivier THIERRY on 10/1/13.
//  Copyright (c) 2013 behave.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Behave/Behave.h>

#import "BHPopupViewController.h"

#if __has_include(<FacebookSDK/FacebookSDK.h>)
#import <FacebookSDK/FacebookSDK.h>
#endif

@interface BHBadgeUnlockViewController : BHPopupViewController

@property (nonatomic, readonly) BHBadge *badge;

- (id) initWithBadge:(BHBadge*)badge;

@end
