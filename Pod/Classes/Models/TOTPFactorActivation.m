//
//  TOTPFactorActivation.m
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import "TOTPFactorActivation.h"
#import "Link.h"

@implementation TOTPFactorActivation

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{@"timeStep" : @"timeStep",
             @"sharedSecret" : @"sharedSecret",
             @"encoding" : @"encoding",
             @"keyLength" : @"keyLength",
             @"qrcode" : @"qrcode"
             };
}

+ (NSValueTransformer *)qrcodeJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:Link.class];
}

@end
