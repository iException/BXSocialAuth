//
//  BXSocialAuth+WeChat.h
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import <BXSocialAuth/BXSocialAuth.h>

@interface BXSocialAuth (WeChat)

- (void)registerWeChatWithAppID:(NSString *)appID;
- (void)authorizeWeChatWithCompletion:(BXSocialAuthCompletionHandler)completion;

@end
