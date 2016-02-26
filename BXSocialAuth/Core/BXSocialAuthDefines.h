//
//  BXSocialAuthDefines.h
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

@import Foundation;

FOUNDATION_EXPORT NSString *const BXSocialAuthErrorDomain;
FOUNDATION_EXPORT NSString *const BXSocialAuthErrorUserInfoMessageKey;


typedef NS_ENUM(NSInteger, BXSocialAuthErrorCode) {
    BXSocialAuthErrorCodeUnknown = 1000,
    BXSocialAuthErrorCodeUserCancelled,
    BXSocialAuthErrorCodeNetwork,
    BXSocialAuthErrorCodeBadRequest,
    BXSocialAuthErrorCodeAccessDenied,
};

typedef void (^BXSocialAuthCompletionHandler)(id responseObject, NSError *error);
