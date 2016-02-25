//
//  BXSocialAuthWeChatProvider.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthWeChatProvider.h"
#import <BXSocialAuth/UIViewController+BXSocialAuthAdditions.h>
#import <BXWeChatSDK/WXApi.h>

@interface BXSocialAuthWeChatProvider () <WXApiDelegate>

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
    NSLog(@"WeChat API delegate [onRequest]: <%@>", request);
}


-(void)onResp:(BaseResp *)response {
    NSLog(@"WeChat API delegate [onResponse]: <%@>", response);
    
    if ([response isKindOfClass:[SendAuthResp class]]) {
        SendAuthResp *authResponse = (SendAuthResp *)response;
        
        // TODO: invoke completion handler
        NSLog(@"WeChat Auth Response: %@", authResponse);
    }
}

@end
