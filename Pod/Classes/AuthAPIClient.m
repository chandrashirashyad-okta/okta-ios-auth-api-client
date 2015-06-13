//
//  AuthAPIClient.m
//  OvercoatTest
//
//  Created by Chandra Shirashyad on 5/26/15.
//  Copyright (c) 2015 Chandra Shirashyad. All rights reserved.
//

#import "AuthAPIClient.h"
#import "Authentication.h"

@implementation AuthAPIClient

- (NSDictionary *)authenticate {
    NSDictionary *params = @{ @"username": @"Administrator1",
                              @"password": @"Abcd1234"
                              };

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    [manager POST:@"authn" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        self.auth = responseObject;
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    return self.auth;
}

- (void)authenticate:(NSString *)username
            password:(NSString *)password
             success:(void (^)(Authentication *auth))success
             failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    NSDictionary *params = @{@"username": username,
                             @"password": password
                             };
    [manager POST:@"authn" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dict = (NSDictionary *) responseObject;
        NSError *error = [[NSError alloc] init];
        Authentication *auth = [MTLJSONAdapter modelOfClass:Authentication.class fromJSONDictionary:dict error:&error];
        if (error == nil)
        {
            success(auth);
        }
        else {
            failure(error);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

- (void)verifyQuestionFactor:(NSString *)fid
                  stateToken:(NSString *)stateToken
                      answer:(NSString *)answer
                   verifyUrl:(NSString *)verifyUrl
                     success:(void (^)(Authentication *auth))success
                     failure:(void (^)(NSError *error))failure {
    
}

- (void)verifySMSFactor:(NSString *)fid
             stateToken:(NSString *)stateToken
               passCode:(NSString *)passCode
                success:(void (^)(Authentication *auth))success
                failure:(void (^)(NSError *error))failure {
    
}

- (void)verifyTokenFactor:(NSString *)fid
               stateToken:(NSString *)stateToken
                 passCode:(NSString *)passCode
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error))failure {
    
}

- (void)changeExpiredPassword:(NSString *)stateToken
                  oldPassword:(NSString *)oldPassword
                nuevoPassword:(NSString *)nuevoPassword
                      nextUrl:(NSString *)nextUrl
                      success:(void (^)(Authentication *auth))success
                      failure:(void (^)(NSError *error))failure {
    
}

- (void)enrollQuestionFactor:(NSString *)factorType
                  stateToken:(NSString *)stateToken
                    provider:(NSString *)provider
                     profile:(QuestionFactorProfile *)profile
                   enrollUrl:(NSString *)enrollUrl
                     success:(void (^)(Authentication *auth))success
                     failure:(void (^)(NSError *error))failure {
    
}

- (void)enrollSMSFactor:(NSString *)factorType
             stateToken:(NSString *)stateToken
               provider:(NSString *)provider
            phoneNumber:(NSString *)phoneNumber
              enrollUrl:(NSString *)enrollUrl
                success:(void (^)(Authentication *auth))success
                failure:(void (^)(NSError *error))failure {
    
}

- (void)enrollTokenFactor:(NSString *)factorType
               stateToken:(NSString *)stateToken
                 provider:(NSString *)provider
                enrollUrl:(NSString *)enrollUrl
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error)) failure {
    
}

- (void)getQuestionsList:(NSString *)questionsUrl
                 success:(void (^)(NSArray *questions))success
                 failure:(void (^)(NSError *error))failure {
    
}

- (void)activateTokenFactor:(NSString *)fid
                 stateToken:(NSString *)stateToken
                   passCode:(NSString *)passCode
                activateUrl:(NSString *)activateUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure {
    
}

- (void)activateSMSFactor:(NSString *)fid
               stateToken:(NSString *)stateToken
                 passCode:(NSString *)passCode
              activateUrl:(NSString *)activateUrl
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error))failure {
    
}

- (void)forgotPassword:(NSString *)username
            relayState:(NSString *)relayState
               success:(void (^)(Authentication *auth))success
               failure:(void (^)(NSError *error))failure {
    
}

- (void)unlockAccount:(NSString *)username
           relayState:(NSString *)relayState
              success:(void (^)(Authentication *auth))success
              failure:(void (^)(NSError *error))failure {
    
}

- (void)verifyRecoveryToken:(NSString *)recoveryToken
                recoveryUrl:(NSString *)recoveryUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure {
    
}

- (void)answerRecoveryToken:(NSString *)stateToken
                     answer:(NSString *)answer
                  answerUrl:(NSString *)answerUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure {
    
}

- (void)resetPassword:(NSString *)stateToken
        nuevoPassword:(NSString *)nuevoPassword
     resetPasswordUrl:(NSString *)resetPasswordUrl
              success:(void (^)(Authentication *auth))success
              failure:(void (^)(NSError *error))failure {
    
}

- (void)getSessionSuccess:(void (^)(OKSession *session))success
                  failure:(void (^)(NSError *error))failure {
    
}

@end
