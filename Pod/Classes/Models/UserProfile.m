//
//  UserProfile.m
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import "UserProfile.h"

@implementation UserProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"login": @"login",
             @"firstName": @"firstName",
             @"lastName": @"lastName",
             @"locale": @"locale",
             @"timeZone": @"timeZone"
             };
}

@end
