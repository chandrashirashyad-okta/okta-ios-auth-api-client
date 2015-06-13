//
//  Factor.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import <Foundation/Foundation.h>
#import "QuestionFactorProfile.h"
#import "Phone.h"
#import "SMSFactorProfile.h"
#import "TOTPFactorProfile.h"
#import "TOTPFactorActivation.h"
#import "Mantle.h"

@interface Factor : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* factorId;
@property (strong, nonatomic) NSString* factorType;
@property (strong, nonatomic) NSString* provider;
//@property (strong, nonatomic) FactorProfile* profile;  //Attempt to dynamicly map Factor Profile later.
@property (strong, nonatomic) QuestionFactorProfile* questionFactorProfile;
@property (strong, nonatomic) SMSFactorProfile* smsFactorProfile;
@property (strong, nonatomic) TOTPFactorProfile* totpFactorProfile;

//Embeded Resources
@property (strong, nonatomic) TOTPFactorActivation* totpFactorActivation;
@property (strong, nonatomic) Phone* phone;

//Links
@property (strong, nonatomic) Link* enroll;
@property (strong, nonatomic) Link* verify;
@property (strong, nonatomic) Link* selfX;    //since self is a reserved word
@property (strong, nonatomic) Link* user;
@property (strong, nonatomic) Link* activate;
@property (strong, nonatomic) Link* deactivate;
@property (strong, nonatomic) Link* questions;

@end
