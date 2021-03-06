//
//  BXSocialAuth.h
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthDefines.h"

@class BXSocialAuthProvider;

@interface BXSocialAuth : NSObject

+ (instancetype)sharedInstance;

- (void)registerProviders:(NSDictionary<NSString *, BXSocialAuthProvider *> *)providers;
- (void)setProvider:(BXSocialAuthProvider *)provider forKey:(NSString *)key;
- (void)removeProviderForKey:(NSString *)key;
- (BXSocialAuthProvider *)providerForKey:(NSString *)key;

- (void)authorize:(NSString *)providerKey completion:(BXSocialAuthCompletionHandler)completion;
- (void)authorizeProvider:(BXSocialAuthProvider *)provider completion:(BXSocialAuthCompletionHandler)completion;

- (BOOL)handleCallbackURL:(NSURL *)URL;

@end
