//
//  Author.h
//  ReadingList
//
//  Created by Van Simmons on 9/27/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface Author : ModelObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, readonly) NSString *fullName;

@end

NS_ASSUME_NONNULL_END
