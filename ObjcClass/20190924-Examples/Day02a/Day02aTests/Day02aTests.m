//
//  Day02aTests.m
//  Day02aTests
//
//  Created by Van Simmons on 9/24/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface Day02aTests : XCTestCase

@end

@implementation Day02aTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testPersonRequiresInit {
    Person *person = [[Person alloc] init];
    XCTAssertNil(person);
}

- (void)testPersonInit {
    Person *person = [[Person alloc] initWithFirstName:@"Van" lastName:@"Simmons" age:39];
    
    XCTAssertNotNil(person);
    XCTAssertEqual(person.lastName, @"Simmons");
}

- (void)testDescription {
    Person *person = [[Person alloc] initWithFirstName:@"Van" lastName:@"Simmons" age:39];
    
    XCTAssertTrue([@"Simmons, Van" isEqualToString:[person description]]);
}

@end
