//
//  B.h
//  MemoryExample
//
//  Created by Van Simmons on 9/25/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MemoryExampleA;

@interface MemoryExampleB : NSObject

@property (nonatomic, strong) MemoryExampleA *a;

@end

NS_ASSUME_NONNULL_END
