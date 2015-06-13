//
//  contextObject.m
//  Pods
//
//  Created by Chandra Shirashyad on 12/26/14.
//
//

#import "AuthenticationContext.h"

@implementation AuthenticationContext

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{@"ipAddress" : @"ipAddress",
             @"userAgent" : @"userAgent",
             @"deviceToken" : @"deviceToken"
             };
}

@end
