//
//  BXAppDelegate.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 02/22/2016.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXAppDelegate.h"
#import "BXSocialAuth_Example-Swift.h"
//#import "BXViewController.h"
#import <BXSocialAuth/BXSocialAuth+Tencent.h>
#import <BXSocialAuth/BXSocialAuth+WeChat.h>

static NSString *const kBXSocialAuthDemoWeChatAppID = @"YOUR_WECHAT_APP_ID";
static NSString *const kBXSocialAuthDemoTencentAppID = @"YOUR_TENCENT_APP_ID";

@implementation BXAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[BXViewController alloc] init]];
    [self configureAuthorizaionProviders];
    [self.window makeKeyAndVisible];
    return YES;
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[BXSocialAuth sharedInstance] handleCallbackURL:url];
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[BXSocialAuth sharedInstance] handleCallbackURL:url];
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    return [[BXSocialAuth sharedInstance] handleCallbackURL:url];
}


#pragma mark - Private

- (void)configureAuthorizaionProviders {
    BXSocialAuth *socialAuth = [BXSocialAuth sharedInstance];
    [socialAuth registerTencentWithAppID:kBXSocialAuthDemoTencentAppID];
    [socialAuth registerWeChatWithAppID:kBXSocialAuthDemoWeChatAppID];
}

@end
