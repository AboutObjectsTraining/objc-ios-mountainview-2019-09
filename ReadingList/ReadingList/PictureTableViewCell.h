//
//  PictureTableViewCell.h
//  ReadingList
//
//  Created by Van Simmons on 9/27/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PictureTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet UIImageView *image;

@end

NS_ASSUME_NONNULL_END
