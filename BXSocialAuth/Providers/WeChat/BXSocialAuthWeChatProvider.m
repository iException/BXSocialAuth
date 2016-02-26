//
//  BXSocialAuthWeChatProvider.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthWeChatProvider.h"
#import "BXSocialAuthWeChatAuthResult.h"
#import <BXSocialAuth/UIViewController+BXSocialAuthAdditions.h>
#import <BXWeChatSDK/WXApi.h>

@interface BXSocialAuthWeChatProvider () <WXApiDelegate>

@property (nonatomic, copy) NSString *lastAuthRequestStateString;

@end


@implementation BXSocialAuthWeChatProvider

#pragma mark - BXSocialAuthProvider

+ (NSString *)type {
    return @"WeChat";
}


+ (BOOL)isAppInstalled {
    return [WXApi isWXAppInstalled];
}


- (BOOL)handleCallbackURL:(NSURL *)URL {
    return [WXApi handleOpenURL:URL delegate:self];
}


- (void)authorizeWithCompletion:(BXSocialAuthCompletionHandler)completion {
    [self authorizeFromViewController:[UIViewController bxsa_topmostViewController] completion:completion];
}


- (void)authorizeFromViewController:(UIViewController *)viewController completion:(BXSocialAuthCompletionHandler)completion {
    SendAuthReq *request = [[SendAuthReq alloc] init];
    request.scope = @"snsapi_userinfo";
    request.state = [[NSUUID UUID] UUIDString];
    self.lastAuthRequestStateString = request.state;
    self.completionHandler = completion;
    [WXApi sendAuthReq:request viewController:viewController delegate:self];
}


#pragma mark - Initialization

- (instancetype)initWithAppID:(NSString *)appID {
    if ((self = [super init])) {
        [WXApi registerApp:appID];
    }
    return self;
}


#pragma mark - WXApiDelegate

-(void)onReq:(BaseReq *)request {
    NSLog(@"[BXSocialAuth] WeChat API delegate [onRequest]: %@", request);
}


-(void)onResp:(BaseResp *)response {
    NSLog(@"[BXSocialAuth] WeChat API delegate [onResponse]: %@", response);
    
    if (![response isKindOfClass:[SendAuthResp class]]) {
        return;
    }
    
    SendAuthResp *authResponse = (SendAuthResp *)response;
    NSError *error = nil;
    NSString *errorMessage = authResponse.errStr ? : @"";
    NSDictionary *userInfo = @{BXSocialAuthErrorUserInfoMessageKey: errorMessage};
    switch (authResponse.errCode) {
        case WXSuccess: {
            if (![authResponse.state isEqualToString:self.lastAuthRequestStateString]) {
                userInfo = @{BXSocialAuthErrorUserInfoMessageKey: @"The response's state string is not equal to that of the original request."};
                error = [NSError errorWithDomain:BXSocialAuthErrorDomain code:BXSocialAuthErrorCodeUnknown userInfo:userInfo];
            }
            break;
        }
        case WXErrCodeCommon: {
            error = [NSError errorWithDomain:BXSocialAuthErrorDomain code:BXSocialAuthErrorCodeUnknown userInfo:userInfo];
            break;
        }
        case WXErrCodeUserCancel: {
            error = [NSError errorWithDomain:BXSocialAuthErrorDomain code:BXSocialAuthErrorCodeUserCancelled userInfo:userInfo];
            break;
        }
        case WXErrCodeSentFail: {
            error = [NSError errorWithDomain:BXSocialAuthErrorDomain code:BXSocialAuthErrorCodeNetwork userInfo:userInfo];
            break;
        }
        case WXErrCodeAuthDeny: {
            error  = [NSError errorWithDomain:BXSocialAuthErrorDomain code:BXSocialAuthErrorCodeAccessDenied userInfo:userInfo];
            break;
        }
        case WXErrCodeUnsupport: {
            error = [NSError errorWithDomain:BXSocialAuthErrorDomain code:BXSocialAuthErrorCodeBadRequest userInfo:userInfo];
            break;
        }
    }
    
    BXSocialAuthWeChatAuthResult *result = [[BXSocialAuthWeChatAuthResult alloc] initWithCode:authResponse.code language:authResponse.lang country:authResponse.country];
    self.completionHandler(result, error);
}

@end
