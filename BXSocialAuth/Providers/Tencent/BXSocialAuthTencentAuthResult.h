//
//  BXSocialAuthTencentAuthResult.h
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/26/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import <BXSocialAuth/BXSocialAuthResult.h>

@interface BXSocialAuthTencentAuthResult : BXSocialAuthResult

@property (nonatomic, copy, readonly) NSString *openID;
@property (nonatomic, copy, readonly) NSString *accessToken;
@property (nonatomic, readonly) NSDate *expirationDate;

- (instancetype)initWithAccessToken:(NSString *)accessToken expirationDate:(NSDate *)expirationDate openID:(NSString *)openID;

@end
