//
//  Factor.m
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import "Factor.h"

@implementation Factor

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{ @"factorId": @"id",
              @"factorType": @"factorType",
              @"provider": @"provider",

              @"questionFactorProfile": @"profile",
              @"smsFactorProfile": @"profile",
              @"totpFactorProfile": @"profile",
              @"totpFactorActivation": @"activation",
              @"phone": @"phone",

              @"enroll": @"_links.enroll",
              @"verify": @"_links.verify",
              @"selfX": @"_links.self",
              @"user": @"_links.user",
              @"activate": @"_links.activate",
              @"deactivate": @"_links.deactivate",
              @"questions": @"_links.questions"
              };
}

+ (NSValueTransformer *)questionFactorProfileJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:QuestionFactorProfile.class];
}

+ (NSValueTransformer *)smsFactorProfileJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:SMSFactorProfile.class];
}

+ (NSValueTransformer *)totpFactorProfileJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:TOTPFactorProfile.class];
}

+ (NSValueTransformer *)phoneJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Phone.class];
}

+ (NSValueTransformer *)selfXJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

+ (NSValueTransformer *)activateJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

+ (NSValueTransformer *)deactivateJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

+ (NSValueTransformer *)questionsJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

+ (NSValueTransformer *)verifyJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

+ (NSValueTransformer *)enrollJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

@end
