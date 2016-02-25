//
//  BXSocialAuth+Tencent.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuth+Tencent.h"
#import "BXSocialAuthTencentProvider.h"

@implementation BXSocialAuth (Tencent)

- (void)registerTencentWithAppID:(NSString *)appID {
    NSParameterAssert(appID != nil);
    
    BXSocialAuthProvider *provider = [[BXSocialAuthTencentProvider alloc] initWithAppID:appID];
    [self setProvider:provider forKey:[BXSocialAuthTencentProvider type]];
}


- (void)authorizeTencentWithCompletion:(BXSocialAuthCompletionHandler)completion {
    [self authorize:[BXSocialAuthTencentProvider type] completion:completion];
}

@end
