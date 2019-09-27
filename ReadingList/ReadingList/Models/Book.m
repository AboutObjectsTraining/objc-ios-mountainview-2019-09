//
//  Book.m
//  ReadingList
//
//  Created by Van Simmons on 9/27/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import "Book.h"
#import "Author.h"

@implementation Book

+ (NSMutableArray <Book *> *) readingList {
    NSDictionary *shakespeare = @{
                            @"lastName": @"Shakespeare",
                            @"firstName": @"William"
                            };
    NSDictionary *simmons = @{
                                  @"lastName": @"Simmons",
                                  @"firstName": @"Van"
                                  };
    NSArray *books = @[
                       @{
                           @"title": @"adventures in teaching objc",
                           @"year": @2019,
                           @"author": simmons
                           },
                       @{
                           @"title": @"MacBeth",
                           @"year": @1612,
                           @"author": shakespeare
                           },
                       @{
                           @"title": @"adventures in teaching objc volumes",
                           @"year": @2019,
                           @"author": simmons
                           },
                       @{
                           @"title": @"Hamlet",
                           @"year": @1604,
                           @"author": shakespeare
                           },
                       ];
    NSMutableArray *m = [NSMutableArray array];
    for (NSDictionary *d in books) {
        [m addObject:[[Book alloc] initWithDictionary:d]];
    }
    return m;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"author"] && [value isKindOfClass:NSDictionary.class])
    {
        value = [Author modelObjectWithDictionary:value];
    }
    
    [super setValue:value forKey:key];
}


@end
