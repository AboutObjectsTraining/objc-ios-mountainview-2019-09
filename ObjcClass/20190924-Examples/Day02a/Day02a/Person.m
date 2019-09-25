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
    return [self initWithFirstName:nil lastName:nil age:0];
}

+ (instancetype)personWithFirstName:(NSString *)firstName
                           lastName:(NSString *)lastName
                                age:(NSInteger)age {
    return [[self alloc] initWithFirstName:firstName lastName:lastName age:age];
}

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSInteger)age {
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _age = age;
    }
    return self;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"%@, %@", self.lastName, self.firstName];
}

@end
