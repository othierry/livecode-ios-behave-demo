//
//  LCLeaderboadCell.h
//  LiveCode
//
//  Created by Olivier THIERRY on 17/05/14.
//  Copyright (c) 2014 Behave.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCLeaderboadCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *positionLabel;
@property (nonatomic, weak) IBOutlet UIImageView *pictureImageView;

@end
