//
//  ClassA.h
//  MemoryExample
//
//  Created by Van Simmons on 9/25/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemoryExampleB.h"

@class MemoryExampleB;

NS_ASSUME_NONNULL_BEGIN

@interface MemoryExampleA : NSObject

@property (nonatomic, strong) MemoryExampleB *b;
@property (nonatomic, copy, nullable) void (^aBlock)(void);

@end

NS_ASSUME_NONNULL_END
