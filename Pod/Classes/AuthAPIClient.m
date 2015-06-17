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
//        NSLog(@"%@", dict);
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
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"fid": fid,
                             @"stateToken": stateToken,
                             @"answer": answer,
                             @"verifyUrl": verifyUrl
                             };
    [manager POST:verifyUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)verifySMSFactor:(NSString *)fid
             stateToken:(NSString *)stateToken
               passCode:(NSString *)passCode
                success:(void (^)(Authentication *auth))success
                failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"fid": fid,
                             @"stateToken": stateToken,
                             @"passcode": passCode
                             };
    [manager POST:fid parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)verifyTokenFactor:(NSString *)fid
               stateToken:(NSString *)stateToken
                 passCode:(NSString *)passCode
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"fid": fid,
                             @"stateToken": stateToken,
                             @"passcode": passCode
                             };
    [manager POST:fid parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)changeExpiredPassword:(NSString *)stateToken
                  oldPassword:(NSString *)oldPassword
                nuevoPassword:(NSString *)nuevoPassword
                      nextUrl:(NSString *)nextUrl
                      success:(void (^)(Authentication *auth))success
                      failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"oldPassword": oldPassword,
                             @"stateToken": stateToken,
                             @"nuevoPassword": nuevoPassword
                             };
    [manager POST:nextUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)enrollQuestionFactor:(NSString *)factorType
                  stateToken:(NSString *)stateToken
                    provider:(NSString *)provider
                     profile:(QuestionFactorProfile *)profile
                   enrollUrl:(NSString *)enrollUrl
                     success:(void (^)(Authentication *auth))success
                     failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"factorType": factorType,
                             @"stateToken": stateToken,
                             @"provider": provider,
                             @"profile": profile
                             };
    [manager POST:enrollUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)enrollSMSFactor:(NSString *)factorType
             stateToken:(NSString *)stateToken
               provider:(NSString *)provider
            phoneNumber:(NSString *)phoneNumber
              enrollUrl:(NSString *)enrollUrl
                success:(void (^)(Authentication *auth))success
                failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"factorType": factorType,
                             @"stateToken": stateToken,
                             @"provider": provider,
                             @"phoneNumber": phoneNumber
                             };
    [manager POST:enrollUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)enrollTokenFactor:(NSString *)factorType
               stateToken:(NSString *)stateToken
                 provider:(NSString *)provider
                enrollUrl:(NSString *)enrollUrl
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error)) failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"factorType": factorType,
                             @"stateToken": stateToken,
                             @"provider": provider
                             };
    [manager POST:enrollUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)getQuestionsList:(NSString *)questionsUrl
                 success:(void (^)(NSArray *questions))success
                 failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
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
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"fid": fid,
                             @"stateToken": stateToken,
                             @"passCode": passCode
                             };
    [manager POST:activateUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)activateSMSFactor:(NSString *)fid
               stateToken:(NSString *)stateToken
                 passCode:(NSString *)passCode
              activateUrl:(NSString *)activateUrl
                  success:(void (^)(Authentication *auth))success
                  failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"fid": fid,
                             @"stateToken": stateToken,
                             @"passCode": passCode
                             };
    [manager POST:activateUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)forgotPassword:(NSString *)username
            relayState:(NSString *)relayState
               success:(void (^)(Authentication *auth))success
               failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"username": username,
                             @"relayState": relayState
                             };
    [manager POST:OK_FORGOT_PASSWORD_URI parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)unlockAccount:(NSString *)username
           relayState:(NSString *)relayState
              success:(void (^)(Authentication *auth))success
              failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"username": username,
                             @"relayState": relayState
                             };
    [manager POST:OK_UNLOCK_ACCOUNT_URI parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)verifyRecoveryToken:(NSString *)recoveryToken
                recoveryUrl:(NSString *)recoveryUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"recoveryToken": recoveryToken
                             };
    [manager POST:OK_FORGOT_PASSWORD_URI parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)answerRecoveryToken:(NSString *)stateToken
                     answer:(NSString *)answer
                  answerUrl:(NSString *)answerUrl
                    success:(void (^)(Authentication *auth))success
                    failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @{@"stateToken": stateToken,
                             @"answer": answer
                             };
    [manager POST:answerUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)resetPassword:(NSString *)stateToken
        nuevoPassword:(NSString *)nuevoPassword
     resetPasswordUrl:(NSString *)resetPasswordUrl
              success:(void (^)(Authentication *auth))success
              failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    NSDictionary *params = @{@"stateToken": stateToken,
                             @"nuevoPassword": nuevoPassword
                             };
    [manager POST:resetPasswordUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void)getSessionSuccess:(void (^)(OKSession *session))success
                  failure:(void (^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
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

