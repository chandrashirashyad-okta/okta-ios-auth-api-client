//
//  TOTPFactorProfile.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import "FactorProfile.h"
#import "Mantle.h"

@interface TOTPFactorProfile : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* credentialId;

@end
