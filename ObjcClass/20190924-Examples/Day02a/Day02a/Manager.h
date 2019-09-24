//
//  Manager.h
//  Day02a
//
//  Created by Van Simmons on 9/24/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Manager : Person

@property (nonatomic, copy) NSArray *directReports;

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                             age:(NSInteger)age
                   directReports:(NSArray *)reports;

-(void)addDirectReport:(Person *)aPerson;

@end

NS_ASSUME_NONNULL_END
