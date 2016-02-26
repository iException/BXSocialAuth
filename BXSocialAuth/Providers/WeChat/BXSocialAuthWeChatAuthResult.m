//
//  BXSocialAuthWeChatAuthResult.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/26/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthWeChatAuthResult.h"

@implementation BXSocialAuthWeChatAuthResult

#pragma mark - Initialization

- (instancetype)initWithCode:(NSString *)code language:(NSString *)language country:(NSString *)country {
    if ((self = [super init])) {
        _code = [code copy];
        _language = [language copy];
        _country = [country copy];
    }
    
    return self;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"<WeChatAuthResult>:{\n\tcode: %@,\n\tlanguage: %@,\n\tcountry: %@\n}", self.code, self.language, self.country];
}

@end
