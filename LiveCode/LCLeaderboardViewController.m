//
//  LCLeaderboardViewController.m
//  LiveCode
//
//  Created by Olivier THIERRY on 16/05/14.
//  Copyright (c) 2014 Behave.io. All rights reserved.
//

#import "LCLeaderboardViewController.h"

#import "LCLeaderboadCell.h"

@interface LCLeaderboardViewController ()

@property (nonatomic, strong) BHLeaderboardResults *leaderboardResults;

@end

@implementation LCLeaderboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[Behave sharedInstance] fetchResultsForLeaderboard:@"points"
                                             completion:^(BHLeaderboardResults *results) {
                                                 [self setLeaderboardResults:results];
                                                 [self.tableView reloadData];
                                             }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.leaderboardResults.scores.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LCLeaderboadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeaderboardCell" forIndexPath:indexPath];
    
    BHLeaderboardScore *score = self.leaderboardResults.scores[indexPath.row];
    
    [cell.pictureImageView setImageWithURL:score.player.pictureURL];
    [cell.nameLabel setText:score.player.name];
    [cell.positionLabel setText:[NSString stringWithFormat:@"#%d", score.position]];
    [cell.scoreLabel setText:[NSString stringWithFormat:@"%d points", score.score]];
    
    return cell;
}

@end
