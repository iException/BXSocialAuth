//
//  BXSocialAuthTencentProvider.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthTencentProvider.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface BXSocialAuthTencentProvider () <TencentSessionDelegate>

@property (nonatomic) TencentOAuth *tencentOAuth;

@end


@implementation BXSocialAuthTencentProvider

#pragma mark - BXSocialAuthProvider

+ (NSString *)type {
    return @"Tencent";
}

+ (BOOL)isAppInstalled {
    return [TencentOAuth iphoneQQInstalled] || [TencentOAuth iphoneQZoneInstalled];
}


- (void)authorizeWithCompletion:(BXSocialAuthCompletionHandler)completion {
    if ([TencentOAuth authorizeState] != kTencentNotAuthorizeState) {
        NSDictionary *userInfo = @{
            BXSocialAuthErrorUserInfoMessageKey : @"Another authentication task is running."
        };
        NSError *error = [NSError errorWithDomain:BXSocialAuthErrorDomain code:BXSocialAuthErrorCodeBadRequest userInfo:userInfo];
        completion(nil, error);
        return;
    }
    
    self.completionHandler = completion;
    [self.tencentOAuth authorize:self.permissions];
}


- (BOOL)handleCallbackURL:(NSURL *)URL {
    return [TencentOAuth HandleOpenURL:URL];
}


#pragma mark - Initialization

- (instancetype)initWithAppID:(NSString *)appID {
    if ((self = [super init])) {
        _tencentOAuth = [[TencentOAuth alloc] initWithAppId:appID andDelegate:self];
        _permissions = @[
            kOPEN_PERMISSION_GET_USER_INFO,
            kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
            kOPEN_PERMISSION_GET_INFO,
            kOPEN_PERMISSION_ADD_SHARE
        ];
    }
    return self;
}


#pragma mark - TencentSessionDelegate

- (void)tencentDidLogin {
    NSLog(@"Login Succeeded");
}


- (void)tencentDidNotLogin:(BOOL)cancelled {
    NSError *error = [NSError errorWithDomain:BXSocialAuthErrorDomain code:BXSocialAuthErrorCodeUserCancelled userInfo:nil];
    self.completionHandler(nil, error);
}


- (void)tencentDidNotNetWork {
    self.completionHandler(nil, [NSError errorWithDomain:BXSocialAuthErrorDomain code:BXSocialAuthErrorCodeNetwork userInfo:nil]);
}

@end
