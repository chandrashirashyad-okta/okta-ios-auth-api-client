//
//  QuestionFactorProfile.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import "FactorProfile.h"
#import "Mantle.h"

@interface QuestionFactorProfile : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* question;
@property (strong, nonatomic) NSString* questionText;
@property (strong, nonatomic) NSString* answer;

@end
