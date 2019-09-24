//
//  ManagerTests.m
//  Day02aTests
//
//  Created by Van Simmons on 9/24/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Manager.h"

@interface ManagerTests : XCTestCase

@end

@implementation ManagerTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testManagerInit {
    Manager *m = [[Manager alloc] init];
    XCTAssertNil(m);
    
    m = [[Manager alloc] initWithFirstName:@"Nevill" lastName:@"Wilder" age:28];
    XCTAssertNotNil(m.directReports);
    
    NSArray *people = @[
                        [[Person alloc] initWithFirstName:@"Van"
                                                 lastName:@"Simmons"
                                                      age:27]
                        ];
    m = [[Manager alloc] initWithFirstName:@"Nevill"
                                  lastName:@"Wilder"
                                       age:28
                             directReports:people];
    XCTAssertNotNil(m.directReports);
    XCTAssertEqual(m.directReports.count, 1);
}

- (void)testAddDirectReport {
    NSArray *people = @[
                        [[Person alloc] initWithFirstName:@"Van"
                                                 lastName:@"Simmons"
                                                      age:27]
                        ];
    Manager *m = [[Manager alloc] initWithFirstName:@"Nevill"
                                  lastName:@"Wilder"
                                       age:28
                             directReports:people];
    XCTAssertNotNil(m.directReports);
    XCTAssertEqual(m.directReports.count, 1);
    
    [m addDirectReport:[[Person alloc] initWithFirstName:@"Jonathan"
                                                lastName:@"Lehr"
                                                     age:40]];
    XCTAssertEqual(m.directReports.count, 2);

    [m addDirectReport:people[0]];
    XCTAssertEqual(m.directReports.count, 3);
}

- (void)testDescription {
    NSArray *people = @[
                        [[Person alloc] initWithFirstName:@"Van"
                                                 lastName:@"Simmons"
                                                      age:27]
                        ];
    Manager *m = [[Manager alloc] initWithFirstName:@"Nevill"
                                           lastName:@"Wilder"
                                                age:28
                                      directReports:people];
    
    NSString *d = [m description];
}

@end
