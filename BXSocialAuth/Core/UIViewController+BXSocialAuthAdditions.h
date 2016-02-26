//
//  UIViewController+BXSocialAuthAdditions.h
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/24/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

@import UIKit;

@interface UIViewController (BXSocialAuthAdditions)

+ (UIViewController *)bxsa_topmostViewController;
+ (UIViewController *)bxsa_topmostViewControllerFromRootViewController:(UIViewController *)rootViewController;

@end
