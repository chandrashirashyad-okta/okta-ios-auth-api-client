//
//  OKACError.h
//  Pods
//
//  Created by Chandra Shirashyad on 6/18/15.
//
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface OKACError : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString* errorCode;
@property (strong, nonatomic) NSString* errorSummary;
@property (strong, nonatomic) NSString* errorLink;
@property (strong, nonatomic) NSString* errorId;

@end
