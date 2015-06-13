//
//  OKSession.m
//  OktaPluginTest
//
//  Created by Christine Wang on 3/19/15.
//  Copyright (c) 2015 Okta Inc. All rights reserved.
//

#import "OKSession.h"

@implementation OKSession

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{ @"sid": @"id",
              @"userId": @"userId",
              @"mfaActive": @"mfaActive"
              };
}

@end
