//
//  AppDelegate.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 22.07.2021.
//

#import "AppDelegate.h"
#import "AuthorizationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    if (@available(iOS 13,*)) {
        return YES;
    } else {
        UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        window.rootViewController = [[AuthorizationViewController alloc] init];
        
        [self setWindow:window];
        [self.window makeKeyAndVisible];
        
        return YES;
    }
}

@end
