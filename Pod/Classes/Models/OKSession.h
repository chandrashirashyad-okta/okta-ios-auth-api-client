//
//  OKSession.h
//  OktaPluginTest
//
//  Created by Christine Wang on 3/19/15.
//  Copyright (c) 2015 Okta Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface OKSession : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *sid;
@property (nonatomic, copy) NSDictionary *userId;
@property (nonatomic) BOOL mfaActive;

@end
