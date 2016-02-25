//
//  UIViewController+BXSocialAuthAdditions.m
//  Pods
//
//  Created by Yiming Tang on 2/24/16.
//
//

#import "UIViewController+BXSocialAuthAdditions.h"

@implementation UIViewController (BXSocialAuthAdditions)

+ (UIViewController *)bxsa_topmostViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self bxsa_topmostViewControllerFromRootViewController:rootViewController];
}


+ (UIViewController *)bxsa_topmostViewControllerFromRootViewController:(UIViewController *)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self bxsa_topmostViewControllerFromRootViewController:tabBarController.selectedViewController];
    }
    else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self bxsa_topmostViewControllerFromRootViewController:navigationController.visibleViewController];
    }
    else if (rootViewController.presentedViewController) {
        UIViewController *presentedViewController = rootViewController.presentedViewController;
        return [self bxsa_topmostViewControllerFromRootViewController:presentedViewController];
    }
    else {
        return rootViewController;
    }
}

@end
