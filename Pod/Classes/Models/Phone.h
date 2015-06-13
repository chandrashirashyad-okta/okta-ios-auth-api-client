//
//  Phone.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//
// Sample JSON
// {
//    "id": "mbl198rKSEWOSKRIVIFT",
//    "profile": {
//        "phoneNumber": "+1 XXX-XXX-1337"
//    },
//    "status": "ACTIVE"
// }

#import <Foundation/Foundation.h>
#import "PhoneProfile.h"
#import "Mantle.h"

@interface Phone : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* phoneId;
@property (strong, nonatomic) PhoneProfile* profile;
@property (strong, nonatomic) NSString* status;         //Active or Inactive.

@end
