//
//  SceneDelegate.m
//  Authorization window
//
//  Created by Vladimir Oleinikov on 22.07.2021.
//

@import UIKit;
#import "SceneDelegate.h"
#import "AuthorizationViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions  API_AVAILABLE(ios(13.0)){
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        if ([scene isKindOfClass:UIWindowScene.class]) {
            UIWindow *window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];
            self.window = window;
            window.rootViewController = [[AuthorizationViewController alloc] init];
            
            //window.backgroundColor = UIColor.blueColor;
            //window.rootViewController.view.backgroundColor = UIColor.darkGrayColor;
            
            [self.window makeKeyAndVisible];
        }
    }

@end
