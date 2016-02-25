//
//  UIViewController+BXSocialAuthAdditions.h
//  Pods
//
//  Created by Yiming Tang on 2/24/16.
//
//

@import UIKit;

@interface UIViewController (BXSocialAuthAdditions)

+ (UIViewController *)bxsa_topmostViewController;
+ (UIViewController *)bxsa_topmostViewControllerFromRootViewController:(UIViewController *)rootViewController;

@end
