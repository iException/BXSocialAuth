//
//  BXSocialAuth+WeChat.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuth+WeChat.h"
#import "BXSocialAuthWeChatProvider.h"

@implementation BXSocialAuth (WeChat)

- (void)registerWeChatWithAppID:(NSString *)appID {
    NSParameterAssert(appID != nil);
    
    BXSocialAuthProvider *provider = [[BXSocialAuthWeChatProvider alloc] initWithAppID:appID];
    [self setProvider:provider forKey:[BXSocialAuthWeChatProvider type]];
}


- (void)authorizeWeChatWithCompletion:(BXSocialAuthCompletionHandler)completion {
    [self authorize:[BXSocialAuthWeChatProvider type] completion:completion];
}

@end
