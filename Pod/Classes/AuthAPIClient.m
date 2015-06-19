//
//  AuthAPIClient.m
//  OvercoatTest
//
//  Created by Chandra Shirashyad on 5/26/15.
//  Copyright (c) 2015 Chandra Shirashyad. All rights reserved.
//

#import "AuthAPIClient.h"
#import "Authentication.h"

#define OK_PRIMARY_AUTHENTICATION_URI @"/api/v1/authn"
#define OK_FORGOT_PASSWORD_URI @"/api/v1/authn/recovery/password"
#define OK_UNLOCK_ACCOUNT_URI @"/api/v1/authn/recovery/unlock"
#define OK_SESSION_API @"/api/v1/sessions/me"

@implementation AuthAPIClient

- (id)initWithOrgUrl:(NSString *)url {
    if ( self = [super init] ) {
        if ([url length] == 0) {
            self.kBaseURL = defaultBaseURL;
        }
        else {
            self.kBaseURL = [NSString stringWithFormat:@"%@/api/v1", url];
        }
        return self;
    }
    return nil;
}

- (id)init {
    if ( self = [super init] ) {
        self.kBaseURL = defaultBaseURL;
        return self;
    }
    return nil;
}

- (NSDictionary *)authenticateTest {
    NSDictionary *params = @{ @"username": @"Administrator1",
                              @"password": @"Abcd1234"
                              };

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.kBaseURL]];
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

- (void)httpPostForAuthentication: (NSString *) uri
    params: (NSDictionary *) params
   success:(void (^)(Authentication *auth))success
   failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:uri parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dict = (NSDictionary *) responseObject;
        NSLog(@"%@", dict);
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

- (void)authenticate:(NSString *)username
            password:(NSString *)password
             success:(void (^)(Authentication *auth))success
             failure:(void (^)(NSError *error))failure {
    
    NSDictionary *params = @{@"username": username,
                             @"password": password
                             };
    [self httpPostForAuthentication:@"authn" params:params success:success failure:failure];

}

- (void)verifyQuestionFactor:(NSString *)fid
                  stateToken:(NSString *)stateToken
                      answer:(NSString *)answer
                   verifyUrl:(NSString *)verifyUrl
                     success:(void (^)(Authentication *auth))success
                     failure:(void (^)(NSError *error))failure {
    
    NSDictionary *params = @{@"fid": fid,
                             @"stateToken": stateToken,
                             @"answer": answer,
                             @"verifyUrl": verifyUrl
                             };
    [self httpPostForAuthentication:verifyUrl params:params success:success failure:failure];

}

- (void)verifySMSFactor:(NSString *)fid
             stateToken:(NSString *)stateToken
               passCode:(NSString *)passCode
                success:(void (^)(Authentication *auth))success
                failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{@"fid": fid,
                             @"stateToken": stateToken,
                             @"passcode": passCode
                             };

    [self httpPostForAuthentication:fid params:params success:success failure:failure];

}

- (void)verifyTokenFactor:(NSString *)fid
               stateToken:(NSString *)stateToken
                 passCode:(NSString *)passCode
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{@"fid": fid,
                             @"stateToken": stateToken,
                             @"passcode": passCode
                             };

    [self httpPostForAuthentication:fid params:params success:success failure:failure];

}

- (void)changeExpiredPassword:(NSString *)stateToken
                  oldPassword:(NSString *)oldPassword
                nuevoPassword:(NSString *)nuevoPassword
                      nextUrl:(NSString *)nextUrl
                      success:(void (^)(Authentication *auth))success
                      failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{@"oldPassword": oldPassword,
                             @"stateToken": stateToken,
                             @"nuevoPassword": nuevoPassword
                             };

    [self httpPostForAuthentication:nextUrl params:params success:success failure:failure];

}

- (void)enrollQuestionFactor:(NSString *)factorType
                  stateToken:(NSString *)stateToken
                    provider:(NSString *)provider
                     profile:(QuestionFactorProfile *)profile
                   enrollUrl:(NSString *)enrollUrl
                     success:(void (^)(Authentication *auth))success
                     failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{@"factorType": factorType,
                             @"stateToken": stateToken,
                             @"provider": provider,
                             @"profile": profile
                             };

    [self httpPostForAuthentication:enrollUrl params:params success:success failure:failure];

}

- (void)enrollSMSFactor:(NSString *)factorType
             stateToken:(NSString *)stateToken
               provider:(NSString *)provider
            phoneNumber:(NSString *)phoneNumber
              enrollUrl:(NSString *)enrollUrl
                success:(void (^)(Authentication *auth))success
                failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{@"factorType": factorType,
                             @"stateToken": stateToken,
                             @"provider": provider,
                             @"phoneNumber": phoneNumber
                             };

    [self httpPostForAuthentication:enrollUrl params:params success:success failure:failure];

}

- (void)enrollTokenFactor:(NSString *)factorType
               stateToken:(NSString *)stateToken
                 provider:(NSString *)provider
                enrollUrl:(NSString *)enrollUrl
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error)) failure {

    NSDictionary *params = @{@"factorType": factorType,
                             @"stateToken": stateToken,
                             @"provider": provider
                             };

    [self httpPostForAuthentication:enrollUrl params:params success:success failure:failure];

}

- (void)getQuestionsList:(NSString *)questionsUrl
                 success:(void (^)(NSArray *questions))success
                 failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:questionsUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *arr = (NSArray *) responseObject;
        success(arr);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

- (void)activateTokenFactor:(NSString *)fid
                 stateToken:(NSString *)stateToken
                   passCode:(NSString *)passCode
                activateUrl:(NSString *)activateUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure {
    
    NSDictionary *params = @{@"fid": fid,
                             @"stateToken": stateToken,
                             @"passCode": passCode
                             };

    [self httpPostForAuthentication:activateUrl params:params success:success failure:failure];

}

- (void)activateSMSFactor:(NSString *)fid
               stateToken:(NSString *)stateToken
                 passCode:(NSString *)passCode
              activateUrl:(NSString *)activateUrl
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error))failure {
    
    NSDictionary *params = @{@"fid": fid,
                             @"stateToken": stateToken,
                             @"passCode": passCode
                             };

    [self httpPostForAuthentication:activateUrl params:params success:success failure:failure];

}

- (void)forgotPassword:(NSString *)username
            relayState:(NSString *)relayState
               success:(void (^)(Authentication *auth))success
               failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{@"username": username,
                             @"relayState": relayState
                             };

    [self httpPostForAuthentication:OK_FORGOT_PASSWORD_URI params:params success:success failure:failure];

}

- (void)unlockAccount:(NSString *)username
           relayState:(NSString *)relayState
              success:(void (^)(Authentication *auth))success
              failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{@"username": username,
                             @"relayState": relayState
                             };

    [self httpPostForAuthentication:OK_UNLOCK_ACCOUNT_URI params:params success:success failure:failure];
    
}

- (void)verifyRecoveryToken:(NSString *)recoveryToken
                recoveryUrl:(NSString *)recoveryUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{@"recoveryToken": recoveryToken
                             };

    [self httpPostForAuthentication:OK_FORGOT_PASSWORD_URI params:params success:success failure:failure];

}

- (void)answerRecoveryToken:(NSString *)stateToken
                     answer:(NSString *)answer
                  answerUrl:(NSString *)answerUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{@"stateToken": stateToken,
                             @"answer": answer
                             };

    [self httpPostForAuthentication:answerUrl params:params success:success failure:failure];

}

- (void)resetPassword:(NSString *)stateToken
        nuevoPassword:(NSString *)nuevoPassword
     resetPasswordUrl:(NSString *)resetPasswordUrl
              success:(void (^)(Authentication *auth))success
              failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{@"stateToken": stateToken,
                             @"nuevoPassword": nuevoPassword
                             };

    [self httpPostForAuthentication:resetPasswordUrl params:params success:success failure:failure];

}

- (void)getSessionSuccess:(void (^)(OKSession *session))success
                  failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    [manager POST:OK_SESSION_API parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        OKSession *sess = (OKSession *) responseObject;
            success(sess);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

@end

