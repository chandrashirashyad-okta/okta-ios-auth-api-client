//
//  LinksObject.m
//  Pods
//
//  Created by Chandra Shirashyad on 12/22/14.
//
//

#import "Link.h"

@implementation Link

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{@"href":@"href",
//             @"templated":@"templated",
             @"type":@"type",
             @"deprecation":@"deprecation",
             @"name":@"name",
             @"profile":@"profile",
             @"title":@"title",
             @"hints":@"hints",
             @"hreflang":@"hreflang"
             };
}

+ (NSValueTransformer *)hintsJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Hint.class];
}

@end
