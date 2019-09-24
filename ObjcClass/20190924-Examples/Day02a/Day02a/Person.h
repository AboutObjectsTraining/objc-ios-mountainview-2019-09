//
//  Person.h
//  Day02a
//
//  Created by Van Simmons on 9/24/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign) NSInteger age;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSInteger)age;

- (NSString *)description;

@end

NS_ASSUME_NONNULL_END
