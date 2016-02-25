//
//  BXSocialAuthProvider.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthProvider.h"

@implementation BXSocialAuthProvider

#pragma mark - Class Methods

+ (BOOL)isAppInstalled {
    [self doesNotRecognizeSelector:_cmd];
    return NO;
}


+ (NSString *)type {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}


#pragma mark - Public

- (void)authorizeWithCompletion:(BXSocialAuthCompletionHandler)completion {
    [self doesNotRecognizeSelector:_cmd];
}


- (BOOL)handleCallbackURL:(NSURL *)URL {
    [self doesNotRecognizeSelector:_cmd];
    return NO;
}

@end
