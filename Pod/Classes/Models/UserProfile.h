//
//  UserProfile.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface UserProfile : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* login;
@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* locale;
@property (strong, nonatomic) NSString* timeZone;

@end
