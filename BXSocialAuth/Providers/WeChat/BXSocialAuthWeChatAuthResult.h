//
//  BXSocialAuthWeChatAuthResult.h
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/26/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import <BXSocialAuth/BXSocialAuthResult.h>

@interface BXSocialAuthWeChatAuthResult : BXSocialAuthResult

@property (nonatomic, copy, readonly) NSString *code;
@property (nonatomic, copy, readonly) NSString *language;
@property (nonatomic, copy, readonly) NSString *country;

- (instancetype)initWithCode:(NSString *)code language:(NSString *)language country:(NSString *)country;

@end
