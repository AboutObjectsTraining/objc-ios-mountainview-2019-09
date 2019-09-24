//
//  Person.m
//  Day02a
//
//  Created by Van Simmons on 9/24/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init {
    return nil;
}

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age {
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.age = age;
    }
    return self;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"%@, %@", self.lastName, self.firstName];
}

@end
