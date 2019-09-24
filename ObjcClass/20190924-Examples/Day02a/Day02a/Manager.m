//
//  Manager.m
//  Day02a
//
//  Created by Van Simmons on 9/24/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import "Manager.h"

@implementation Manager

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                             age:(NSInteger)age {
    self = [super initWithFirstName:firstName
                           lastName:lastName
                                age:age];
    if (self) {
        self.directReports = @[];
    }
    return self;
}

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                             age:(NSInteger)age
                   directReports:(NSArray *)reports {
    self = [self initWithFirstName:firstName
                           lastName:lastName
                                age:age];
    if (self) {
        self.directReports = reports;
    }
    return self;
}

-(void)addDirectReport:(Person *)aPerson {
    _directReports = [self.directReports arrayByAddingObject: aPerson];
}

- (NSString*)description {
    NSString *desc = [super description];
    for (Person *p in self.directReports) {
        NSString *d = p.description;
        desc = [desc stringByAppendingString:[NSString stringWithFormat:@"\n\t%@",d]];
    }
    return desc;
}

@end
