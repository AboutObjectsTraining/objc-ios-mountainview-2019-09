//
//  ViewController.m
//  MemoryExample
//
//  Created by Van Simmons on 9/25/19.
//  Copyright © 2019 ComputeCycles, LLC. All rights reserved.
//

#import "ViewController.h"
#import "MemoryExampleA.h"
#import "MemoryExampleB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)allocateAndRelease:(UIButton *)sender {
    MemoryExampleA *a = [[MemoryExampleA alloc] init];
    
    a = nil;
}

- (IBAction)allocate:(UIButton *)sender {
    MemoryExampleA *a = [[MemoryExampleA alloc] init];
    MemoryExampleB *b = [[MemoryExampleB alloc] init];
    
    a.b = b;
    b.a = a;
    
    a = nil;
    b = nil;
}

- (IBAction)blockAllocate:(UIButton *)sender {
    MemoryExampleA *a = [[MemoryExampleA alloc] init];
    
    NSInteger i = 47;
    typeof(MemoryExampleA*) __weak weakA = a;
    a.aBlock = ^ {
        NSLog(@"%@", weakA.description);
        NSLog(@"%ld", (long)i);
    };
    a.aBlock();
    
    a = nil;
}


@end
