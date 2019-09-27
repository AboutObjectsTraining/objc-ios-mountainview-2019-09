//
//  ReadingListTests.m
//  ReadingListTests
//
//  Created by Van Simmons on 9/26/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Author.h"
#import "Book.h"

@interface ReadingListTests : XCTestCase

@end

@implementation ReadingListTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testAuthorCreation {
    NSDictionary *d = @{
                        @"firstName": @"Van",
                        @"lastName": @"Simmons"
                        };
    Author *a = [[Author alloc] initWithDictionary:d];
    XCTAssertNotNil(a, @"author was nil");
}

- (void)testBookCreation {
    NSDictionary *d = @{
                        @"title": @"adventures in teaching objc",
                        @"year": @2019,
                        @"author": @{
                                @"firstName": @"Van",
                                @"lastName": @"Simmons"
                                }
                        };
    Book *b = [[Book alloc] initWithDictionary:d];
    XCTAssertNotNil(b, @"author was nil");
}

- (void)testReadingListCreation {
    NSArray *books = [Book readingList];
    XCTAssertNotNil(books, @"books was nil");
    XCTAssertTrue(books.count == 4, @"wrong number of books");
}

@end
