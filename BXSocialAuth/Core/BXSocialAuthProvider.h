//
//  BXSocialAuthProvider.h
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthDefines.h"

@interface BXSocialAuthProvider : NSObject

@property (nonatomic, copy) BXSocialAuthCompletionHandler completionHandler;

+ (NSString *)type;
+ (BOOL)isAppInstalled;

- (void)authorizeWithCompletion:(BXSocialAuthCompletionHandler)completion;
- (BOOL)handleCallbackURL:(NSURL *)URL;

@end
