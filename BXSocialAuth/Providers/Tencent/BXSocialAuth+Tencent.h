//
//  BXSocialAuth+Tencent.h
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import <BXSocialAuth/BXSocialAuth.h>

@interface BXSocialAuth (Tencent)

- (void)registerTencentWithAppID:(NSString *)appID;
- (void)authorizeTencentWithCompletion:(BXSocialAuthCompletionHandler)completion;

@end
