//
//  BXSocialAuthResult.m
//  BXSocialAuth
//
//  Created by Yiming Tang on 2/26/16.
//  Copyright (c) 2016 Yiming Tang. All rights reserved.
//

#import "BXSocialAuthResult.h"

@implementation BXSocialAuthResult

#pragma mark - NSObject

- (NSString *)description {
    return [NSString stringWithFormat:@"[%@]: %@", [self class], self.dictionaryRepresentation];
}


- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"<%@: %p> %@", [self class], self, self.dictionaryRepresentation];
}


#pragma mark - Public

- (NSDictionary<NSString *,NSString *> *)dictionaryRepresentation {
    return @{};
}

@end
