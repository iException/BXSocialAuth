//
//  BXSocialAuth.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/22/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuth.h"
#import "BXSocialAuthProvider.h"

@interface BXSocialAuth ()

@property (nonatomic) NSMutableDictionary<NSString *, BXSocialAuthProvider *> *providers;

@end


@implementation BXSocialAuth

#pragma mark - Class Methods

+ (instancetype)sharedInstance {
    static BXSocialAuth *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BXSocialAuth alloc] init];
    });
    
    return _sharedInstance;
}


#pragma mark - NSObject

- (instancetype)init {
    if ((self = [super init])) {
        _providers = [NSMutableDictionary dictionary];
    }
    return self;
}


#pragma mark - Public

- (void)registerProviders:(NSDictionary<NSString *,BXSocialAuthProvider *> *)providers {
    [self.providers addEntriesFromDictionary:providers];
}


- (void)setProvider:(BXSocialAuthProvider *)provider forKey:(NSString *)key {
    [self.providers setObject:provider forKey:key];
}


- (void)removeProviderForKey:(NSString *)key {
    [self.providers removeObjectForKey:key];
}


- (BXSocialAuthProvider *)providerForKey:(NSString *)key {
    return [self.providers objectForKey:key];
}


#pragma mark - Authorizing

- (void)authorize:(NSString *)providerKey completion:(BXSocialAuthCompletionHandler)completion {
    
}

@end
