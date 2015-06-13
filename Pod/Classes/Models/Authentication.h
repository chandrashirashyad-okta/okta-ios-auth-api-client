//
//  Authentication.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/18/14.
//
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Link.h"
#import "Mantle.h"
#import "Factor.h"

//@class Factor;

@interface Authentication : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSDate* expiresAt;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* relayState;
@property (strong, nonatomic) NSString* sessionToken;
@property (strong, nonatomic) NSString* stateToken;

//Embeded Resources
@property (strong, nonatomic) User* user;
@property (strong, nonatomic) NSArray* factors;
@property (strong, nonatomic) Factor* factor;   // In case of SMS challenge a single object of Factor is sent as opposed to an Array

////Links
@property (strong, nonatomic) Link* next;
@property (strong, nonatomic) Link* prev;
@property (strong, nonatomic) Link* cancel;
@property (strong, nonatomic) Link* resend;

@end
