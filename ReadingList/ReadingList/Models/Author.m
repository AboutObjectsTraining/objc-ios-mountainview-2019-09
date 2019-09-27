//
//  Author.m
//  ReadingList
//
//  Created by Van Simmons on 9/27/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import "Author.h"

@implementation Author

- (NSString *) fullName {
    return [NSString stringWithFormat:@"%@, %@", self.lastName, self.firstName];
}

@end
