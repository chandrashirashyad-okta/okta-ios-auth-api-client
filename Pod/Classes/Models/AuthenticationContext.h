//
//  contextObject.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/26/14.
//
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface AuthenticationContext : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* ipAddress;
@property (strong, nonatomic) NSString* userAgent;
@property (strong, nonatomic) NSString* deviceToken;

@end
