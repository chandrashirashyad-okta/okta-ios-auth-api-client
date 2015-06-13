//
//  User.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/18/14.
//
//

#import <Foundation/Foundation.h>
#import "UserProfile.h"
#import "RecoveryQuestion.h"
#import "Mantle.h"

@interface User : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* userId;
@property (strong, nonatomic) UserProfile* profile;
@property (strong, nonatomic) RecoveryQuestion* recoveryQuestion;


@end
