//
//  ReadingListTests.m
//  ReadingListTests
//
//  Created by Van Simmons on 9/26/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Author.h"

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

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
