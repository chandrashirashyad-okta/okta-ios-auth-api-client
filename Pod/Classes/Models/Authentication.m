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
             @"factors" : @"factors",
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

    //Another way of doing the same as above.
//+ (NSValueTransformer *)userJSONTransformer {
//    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSDictionary *userDict) {
//        return [MTLJSONAdapter modelOfClass:[User class] fromJSONDictionary:userDict error:nil];
//    } reverseBlock:^id(User *user) {
//        return [MTLJSONAdapter JSONDictionaryFromModel:user];
//    }];
//}

    //If above we mapped user to _embedded instead of _embedded.user.
//+ (NSValueTransformer *)userJSONTransformer {
//    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSDictionary *embeddedDict) {
//        NSDictionary *userDict = [embeddedDict objectForKey:@"user"];
//        return [MTLJSONAdapter modelOfClass:[User class] fromJSONDictionary:userDict error:nil];
//    } reverseBlock:^id(User *user) {
//        NSDictionary *userDict = [MTLJSONAdapter JSONDictionaryFromModel:user];
//        NSDictionary *embeddedDict = @{
//                                       @"user" : userDict
//                                       };
//        return embeddedDict;
//    }];
//}

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
