//
//  AuthAPIClient.h
//  OvercoatTest
//
//  Created by Chandra Shirashyad on 5/26/15.
//  Copyright (c) 2015 Chandra Shirashyad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Models.h"

//static NSString * const kBaseURL = @"https://chandra.okta1.com:80/api/v1/";
//static NSString * const kBaseURL = @"http://rain.okta1.com:1802/api/v1/";
static NSString * const kBaseURL = @"https://shirashyad.oktapreview.com/api/v1/";

@interface AuthAPIClient : NSObject 

@property NSDictionary *auth;

- (NSDictionary *) authenticate;

- (void)authenticate:(NSString *)username
            password:(NSString *)password
             success:(void (^)(Authentication *auth))success
             failure:(void (^)(NSError *error))failure;

- (void)verifyQuestionFactor:(NSString *)fid
                  stateToken:(NSString *)stateToken
                      answer:(NSString *)answer
                   verifyUrl:(NSString *)verifyUrl
                     success:(void (^)(Authentication *auth))success
                     failure:(void (^)(NSError *error))failure;

- (void)verifySMSFactor:(NSString *)fid
             stateToken:(NSString *)stateToken
               passCode:(NSString *)passCode
                success:(void (^)(Authentication *auth))success
                failure:(void (^)(NSError *error))failure;

- (void)verifyTokenFactor:(NSString *)fid
               stateToken:(NSString *)stateToken
                 passCode:(NSString *)passCode
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error))failure;

- (void)changeExpiredPassword:(NSString *)stateToken
                  oldPassword:(NSString *)oldPassword
                nuevoPassword:(NSString *)nuevoPassword
                      nextUrl:(NSString *)nextUrl
                      success:(void (^)(Authentication *auth))success
                      failure:(void (^)(NSError *error))failure;

- (void)enrollQuestionFactor:(NSString *)factorType
                  stateToken:(NSString *)stateToken
                    provider:(NSString *)provider
                     profile:(QuestionFactorProfile *)profile
                   enrollUrl:(NSString *)enrollUrl
                     success:(void (^)(Authentication *auth))success
                     failure:(void (^)(NSError *error))failure;

- (void)enrollSMSFactor:(NSString *)factorType
             stateToken:(NSString *)stateToken
               provider:(NSString *)provider
            phoneNumber:(NSString *)phoneNumber
              enrollUrl:(NSString *)enrollUrl
                success:(void (^)(Authentication *auth))success
                failure:(void (^)(NSError *error))failure;

- (void)enrollTokenFactor:(NSString *)factorType
               stateToken:(NSString *)stateToken
                 provider:(NSString *)provider
                enrollUrl:(NSString *)enrollUrl
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error)) failure;

- (void)getQuestionsList:(NSString *)questionsUrl
                 success:(void (^)(NSArray *questions))success
                 failure:(void (^)(NSError *error))failure;

- (void)activateTokenFactor:(NSString *)fid
                 stateToken:(NSString *)stateToken
                   passCode:(NSString *)passCode
                activateUrl:(NSString *)activateUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure;

- (void)activateSMSFactor:(NSString *)fid
               stateToken:(NSString *)stateToken
                 passCode:(NSString *)passCode
              activateUrl:(NSString *)activateUrl
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error))failure;

- (void)forgotPassword:(NSString *)username
            relayState:(NSString *)relayState
               success:(void (^)(Authentication *auth))success
               failure:(void (^)(NSError *error))failure;

- (void)unlockAccount:(NSString *)username
           relayState:(NSString *)relayState
              success:(void (^)(Authentication *auth))success
              failure:(void (^)(NSError *error))failure;

- (void)verifyRecoveryToken:(NSString *)recoveryToken
                recoveryUrl:(NSString *)recoveryUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure;

- (void)answerRecoveryToken:(NSString *)stateToken
                     answer:(NSString *)answer
                  answerUrl:(NSString *)answerUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure;

- (void)resetPassword:(NSString *)stateToken
        nuevoPassword:(NSString *)nuevoPassword
     resetPasswordUrl:(NSString *)resetPasswordUrl
              success:(void (^)(Authentication *auth))success
              failure:(void (^)(NSError *error))failure;

- (void)getSessionSuccess:(void (^)(OKSession *session))success
                  failure:(void (^)(NSError *error))failure;

@end

