//
//  Authentication.m
//  Pods
//
//  Created by Chandra Shirashyad on 12/18/14.
//
//

#import "Authentication.h"

@implementation Authentication

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"expiresAt" : @"expiresAt",
             @"status" : @"status",
             @"sessionToken" : @"sessionToken",
             @"stateToken" : @"stateToken",
             @"relayState" : @"relayState",
             @"user" : @"_embedded.user",
             @"factors" : @"_embedded.factors",
             @"factor" : @"factor",
             @"next" : @"_links.next",
             @"prev" : @"_links.prev",
             @"cancel" : @"_links.cancel",
             @"resend" : @"_links.resend"
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:User.class];
}

+ (NSValueTransformer *)factorsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:Factor.class];
}

+ (NSValueTransformer *)factorJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Factor.class];
}

+ (NSValueTransformer *)nextJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

+ (NSValueTransformer *)prevJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

+ (NSValueTransformer *)cancelJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

+ (NSValueTransformer *)resendJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

@end
