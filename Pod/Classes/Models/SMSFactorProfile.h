//
//  SMSFactorProfile.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import "FactorProfile.h"
#import "Mantle.h"

@interface SMSFactorProfile : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* phoneNumber;

@end
