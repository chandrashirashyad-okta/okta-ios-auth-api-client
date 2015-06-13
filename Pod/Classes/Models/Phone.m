//
//  Phone.m
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import "Phone.h"
#import "PhoneProfile.h"

@implementation Phone

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{@"phoneId":@"phoneId",
             @"profile":@"profile",
             @"status":@"status"
             };
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:PhoneProfile.class];

}

@end
