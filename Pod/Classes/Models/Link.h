//
//  LinksObject.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/22/14.
//
//  Reference: http://tools.ietf.org/html/draft-kelly-json-hal-06#section-4.1.1

#import <Foundation/Foundation.h>
#import "Hint.h"
#import "Mantle.h"

@interface Link : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString *href;
@property BOOL *templated;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *deprecation;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *profile;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *hreflang;

@property (strong, nonatomic) Hint *hints;

@end
