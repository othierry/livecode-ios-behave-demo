//
//  FOPopupViewController.h
//  FourForOne
//
//  Created by Olivier THIERRY on 3/31/13.
//  Copyright (c) 2013 myself. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BHSimpleBlock)(void);

@interface BHPopupViewController : UIViewController

@property (nonatomic, copy) BHSimpleBlock onCompletion;

@property (nonatomic, weak) IBOutlet UIView *contentView;
@property (nonatomic, weak) IBOutlet UIView *backgroundView;

- (void) showContentViewAnimated:(BOOL)animated completion:(void(^)(void))completion;
- (void) hideContentViewAnimated:(BOOL)animated completion:(void(^)(void))completion;

- (IBAction)exit:(id)sender;

@end
