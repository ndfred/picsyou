//
//  AppDelegate.m
//  Picsyou
//
//  Created by Frédéric Sagnes on 27/09/12.
//  Copyright (c) 2012 teapot apps. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

- (void)dumpSplashImage;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *rootViewController = [[ViewController alloc] initWithNibName:nil bundle:nil];

    window.rootViewController = rootViewController;
    self.window = window;
    [window makeKeyAndVisible];
//    [self dumpSplashImage];

    return YES;
}

- (void)dumpSplashImage {
    UIWindow *window = self.window;
    NSString *fileName = window.screen.scale > 1.0f ? (window.bounds.size.height == 568 ? @"Default-568h@2x.png" : @"Default@2x.png") : @"Default.png";
    NSString *filePath = [@"/Users/fred/Code/teapotapps/picsyou/Resources" stringByAppendingPathComponent:fileName];

    UIGraphicsBeginImageContextWithOptions(window.bounds.size, YES, 0.0f);
    [window.layer renderInContext:UIGraphicsGetCurrentContext()];
    [UIImagePNGRepresentation(UIGraphicsGetImageFromCurrentImageContext()) writeToFile:filePath atomically:YES];
    UIGraphicsEndImageContext();
}

@end
