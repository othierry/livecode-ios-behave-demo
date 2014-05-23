//
//  FOPopupPresenter.h
//  FourForOne
//
//  Created by Olivier THIERRY on 3/31/13.
//  Copyright (c) 2013 myself. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BHPopupViewController.h"

@interface BHPopupPresenter : NSObject

+ (void) presentPopupController:(BHPopupViewController*)popupController
                       fromView:(UIView*)presentingView;

+ (void) presentPopupController:(BHPopupViewController*)popupController
                       fromView:(UIView*)presentingView
                     completion:(BHSimpleBlock)completion;

@end
