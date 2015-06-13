//
//  PhoneProfile.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface PhoneProfile : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* phoneNumber;

@end
