//
//  Book.h
//  ReadingList
//
//  Created by Van Simmons on 9/27/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelObject.h"

NS_ASSUME_NONNULL_BEGIN

@class Author;

@interface Book : ModelObject

+ (NSArray <Book *> *) readingList;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *year;
@property (nonatomic, retain) Author *author;

@end

NS_ASSUME_NONNULL_END
