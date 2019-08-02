//
//  BXSocialAuthTencentProvider.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthTencentProvider.h"
#import "BXSocialAuthTencentAuthResult.h"
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
    return [TencentOAuth iphoneQQInstalled];
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
    NSString *accessToken = self.tencentOAuth.accessToken;
    NSDate *expirationDate = self.tencentOAuth.expirationDate;
    NSString *openID = self.tencentOAuth.openId;
    BXSocialAuthTencentAuthResult *result = [[BXSocialAuthTencentAuthResult alloc] initWithAccessToken:accessToken expirationDate:expirationDate openID:openID];
    self.completionHandler(result, nil);
}


- (void)tencentDidNotLogin:(BOOL)cancelled {
    BXSocialAuthErrorCode errorCode = cancelled ? BXSocialAuthErrorCodeUserCancelled : BXSocialAuthErrorCodeUnknown;
    NSError *error = [NSError errorWithDomain:BXSocialAuthErrorDomain code:errorCode userInfo:nil];
    self.completionHandler(nil, error);
}


- (void)tencentDidNotNetWork {
    self.completionHandler(nil, [NSError errorWithDomain:BXSocialAuthErrorDomain code:BXSocialAuthErrorCodeNetwork userInfo:nil]);
}

@end
