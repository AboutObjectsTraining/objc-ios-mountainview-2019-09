// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNAppDelegate.h"
#import "CLNCoolController.h"

@implementation CLNAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    NSLog(@"In %s", __func__);
    
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = UIColor.yellowColor;
    self.window.rootViewController = [[CLNCoolController alloc] init];
    
    [self.window makeKeyAndVisible];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder)
                                             to:nil
                                           from:nil
                                       forEvent:nil];
}

@end
