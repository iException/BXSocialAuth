//
//  BXSocialAuthWeChatAuthResult.h
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/26/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

@import Foundation;

@interface BXSocialAuthWeChatAuthResult : NSObject

@property (nonatomic, readonly) NSString *code;
@property (nonatomic, readonly) NSString *language;
@property (nonatomic, readonly) NSString *country;

- (instancetype)initWithCode:(NSString *)code language:(NSString *)language country:(NSString *)country;

@end
