//
//  LCViewController.m
//  LiveCode
//
//  Created by Olivier THIERRY on 16/05/14.
//  Copyright (c) 2014 Behave.io. All rights reserved.
//

#import "LCViewController.h"

#import "LCLoginViewController.h"

@interface LCViewController ()

@property (nonatomic, weak) IBOutlet UIImageView    *playerPictureImageView;
@property (nonatomic, weak) IBOutlet UILabel        *playerNameLabel;
@property (nonatomic, weak) IBOutlet UILabel        *pointsLabel;
@property (nonatomic, weak) IBOutlet UILabel        *levelLabel;
@property (nonatomic, weak) IBOutlet UIProgressView *levelProgressView;

@end

@implementation LCViewController

- (void)dealloc
{
    [[Behave sharedInstance] removeObserver:self forKeyPath:@"player.points"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self presentViewController:[LCLoginViewController new]
                       animated:NO
                     completion:nil];
    
    [[Behave sharedInstance] addObserver:self
                              forKeyPath:@"player.points"
                                 options:NSKeyValueObservingOptionNew
                                 context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self updateUI];
    });
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateUI];
}

- (IBAction)checkIn:(id)sender
{
    // Track "check-in" behaviour
    [[Behave sharedInstance] track:@"check-in"];
}

- (IBAction)showBadges:(id)sender
{
    // Display badges collection
    BHBadgesViewController *badgesViewController = [[BHBadgesViewController alloc] init];
    [self.navigationController pushViewController:badgesViewController animated:YES];
}

- (void) updateUI
{
    // Get the currently identified player
    BHPlayer *player = [Behave sharedInstance].player;
    
    [self.playerPictureImageView setImageWithURL:player.pictureURL];
    [self.playerNameLabel setText:[NSString stringWithFormat:@"Bonjour, %@", player.name]];
    
    [self.pointsLabel setText:[NSString stringWithFormat:@"%d points", player.points]];
    [self.levelLabel setText:player.level.name];
    [self.levelProgressView setProgress:player.level.progress / 100 animated:YES];
}

@end
