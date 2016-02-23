//
//  BXSocialAuthProvider.h
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthDefines.h"

@interface BXSocialAuthProvider : NSObject

@property (nonatomic, readonly, copy) NSDictionary *options;

+ (NSString *)type;
+ (NSDictionary *)defaultOptions;

- (instancetype)initWithOptions:(NSDictionary *)options;
- (void)authorizeWithCompletion:(BXSocialAuthCompletionHandler)completion;

@end


@protocol BXSocialAuthSingleSignOnProvider <NSObject>

@required
- (BOOL)handleCallbackURL:(NSURL *)URL;

@end
