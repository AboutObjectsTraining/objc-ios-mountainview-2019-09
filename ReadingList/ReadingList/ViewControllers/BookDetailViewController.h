//
//  BookDetailViewController.h
//  ReadingList
//
//  Created by Van Simmons on 9/27/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookDetailViewController : UIViewController

@property (nonatomic, strong) Book *book;
@property (nonatomic, copy, nullable) void (^updateBook)(Book *);

@end

NS_ASSUME_NONNULL_END
