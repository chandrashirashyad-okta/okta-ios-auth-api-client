//
//  Hints.m
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import "Hint.h"

@implementation Hint

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"allow" : @"allow",
             };
}

//+ (NSValueTransformer *)allowJSONTransformer
//{
//    // tell Mantle to populate Allow property with an array of String objects
//    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[NSArray class]];
//}

@end
