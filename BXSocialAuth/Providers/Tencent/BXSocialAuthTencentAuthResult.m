//
//  BXSocialAuthTencentAuthResult.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/26/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthTencentAuthResult.h"

@implementation BXSocialAuthTencentAuthResult

#pragma mark - Initialization

- (instancetype)initWithAccessToken:(NSString *)accessToken expirationDate:(NSDate *)expirationDate openID:(NSString *)openID {
    if ((self = [super init])) {
        _accessToken = [accessToken copy];
        _expirationDate = expirationDate;
        _openID = [openID copy];
    }
    return self;
}


#pragma mark - BXSocialAuthResult

- (NSDictionary<NSString *,NSString *> *)dictionaryRepresentation {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    dictionary[@"accessToken"] = self.accessToken;
    dictionary[@"expirationDate"] = self.expirationDate;
    dictionary[@"openID"] = self.openID;
    
    return dictionary;
}

@end
