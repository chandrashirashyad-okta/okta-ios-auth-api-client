//
//  QuestionFactorProfile.m
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import "QuestionFactorProfile.h"

@implementation QuestionFactorProfile

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{@"question":@"question",
             @"questionText":@"questionText",
             @"answer":@"answer"
             };
}

@end
