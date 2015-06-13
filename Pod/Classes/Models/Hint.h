//
//  Hints.h
//  Pods
//
//  Created by Chandra Shirashyad on 12/19/14.
//
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface Hint : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSArray* allow;

@end
