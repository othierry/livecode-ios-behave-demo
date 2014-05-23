//
//  BHBadgeViewController.h
//  FourForOne
//
//  Created by Olivier THIERRY on 05/01/14.
//  Copyright (c) 2014 myself. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BHBadge.h"

@interface BHBadgeViewController : UIViewController

@property (nonatomic, strong) BHBadge *badge;
@property (nonatomic) NSDate *unlockedAt;

- (id) initWithBadge:(BHBadge*)badge;

@end
