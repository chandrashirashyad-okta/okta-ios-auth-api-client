//
//  TOTPFactorActivation.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import <Foundation/Foundation.h>
#import "Link.h"
#import "Mantle.h"

@interface TOTPFactorActivation : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* timeStep;
@property (strong, nonatomic) NSString* sharedSecret;
@property (strong, nonatomic) NSString* encoding;       //base32 or base64
@property (strong, nonatomic) NSNumber* keyLength;
@property (strong, nonatomic) Link* qrcode;

@end
