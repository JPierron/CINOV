//
//  QuestionEvent.m
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "QuestionEvent.h"

@implementation QuestionEvent

- (id)init
{
    if ((self = [super init])) {
        
    }
    return self;
}

- (id)initWith:(NSString *)method eventId:(int)eventId questionId:(int)questionId  {
    
    if ((self = [super init])) {
        if ([method isEqualToString:@"GET"]) {
            [self wsGetQuestion:eventId];
        }
        if ([method isEqualToString:@"POST"]) {
            [self wsPostQuestion:eventId];
        }
        if ([method isEqualToString:@"PUT"]) {
            [self wsVoteQuestion:eventId questionId:questionId];
        }
        if ([method isEqualToString:@"DELETE"]) {
            [self wsUnvoteQuestion:eventId questionId:questionId];
        }
    }
    return self;
}

- (void)wsGetQuestion:(int)eventId
{
    // Web service ws_get_events
    NSError *error;
    NSHTTPURLResponse *response;
    NSString *url = [NSString stringWithFormat:@"http://163.5.69.70/webapp/app_dev.php/webservice/events/%d/question", eventId];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSData *conn = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"Status code WS ws_get_question : %d", [response statusCode]);
    
    dataWS = [NSJSONSerialization JSONObjectWithData:conn options:kNilOptions error:&error];
    NSLog(@"ws_get_question : %@", dataWS);
}

- (NSArray *)getQuestion {
    return dataWS;
}

- (void)wsPostQuestion:(int)eventId
{
    
    // Rajouter le content de la question !!!
    
    NSString *url = [NSString stringWithFormat:@"http://163.5.69.70/webapp/app_dev.php/webservice/events/%d/question", eventId];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [defaults objectForKey:@"token"];
    
    // Création du Cookie : SESSIONID:<token:string>
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    [cookieProperties setObject:@"SESSIONID" forKey:NSHTTPCookieName];
    [cookieProperties setObject:token forKey:NSHTTPCookieValue];
    [cookieProperties setObject:@"163.5.69.70" forKey:NSHTTPCookieDomain];
    [cookieProperties setObject:@"163.5.69.70" forKey:NSHTTPCookieOriginURL];
    [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
    [cookieProperties setObject:@"0" forKey:NSHTTPCookieVersion];
    [cookieProperties setObject:[[NSDate date] dateByAddingTimeInterval:262974300] forKey:NSHTTPCookieExpires];
    
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    
    
    // Connexion au Web service
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPShouldHandleCookies:YES];
    
    NSURLConnection *connexion = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!connexion) {
        NSLog(@"Erreur de connexion");
    }
}

- (NSArray *)postQuestion {
    NSLog(@"Return DataWs Post Question");
    return dataWS;
}

- (void)wsVoteQuestion:(int)eventId questionId:(int)questionId
{
    NSString *url = [NSString stringWithFormat:@"http://163.5.69.70/webapp/app_dev.php/webservice/events/%d/question/%d", eventId, questionId];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [defaults objectForKey:@"token"];
    
    // Création du Cookie : SESSIONID:<token:string>
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    [cookieProperties setObject:@"SESSIONID" forKey:NSHTTPCookieName];
    [cookieProperties setObject:token forKey:NSHTTPCookieValue];
    [cookieProperties setObject:@"163.5.69.70" forKey:NSHTTPCookieDomain];
    [cookieProperties setObject:@"163.5.69.70" forKey:NSHTTPCookieOriginURL];
    [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
    [cookieProperties setObject:@"0" forKey:NSHTTPCookieVersion];
    [cookieProperties setObject:[[NSDate date] dateByAddingTimeInterval:262974300] forKey:NSHTTPCookieExpires];
    
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    
    
    // Connexion au Web service
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"PUT"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPShouldHandleCookies:YES];
    
    NSURLConnection *connexion = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!connexion) {
        NSLog(@"Erreur de connexion");
    }
}

- (NSArray *)voteQuestion {
    NSLog(@"Return DataWs vote Question");
    return dataWS;
}

- (void)wsUnvoteQuestion:(int)eventId questionId:(int)questionId
{
    NSString *url = [NSString stringWithFormat:@"http://163.5.69.70/webapp/app_dev.php/webservice/events/%d/question/%d", eventId, questionId];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [defaults objectForKey:@"token"];
    
    // Création du Cookie : SESSIONID:<token:string>
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    [cookieProperties setObject:@"SESSIONID" forKey:NSHTTPCookieName];
    [cookieProperties setObject:token forKey:NSHTTPCookieValue];
    [cookieProperties setObject:@"163.5.69.70" forKey:NSHTTPCookieDomain];
    [cookieProperties setObject:@"163.5.69.70" forKey:NSHTTPCookieOriginURL];
    [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
    [cookieProperties setObject:@"0" forKey:NSHTTPCookieVersion];
    [cookieProperties setObject:[[NSDate date] dateByAddingTimeInterval:262974300] forKey:NSHTTPCookieExpires];
    
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    
    
    // Connexion au Web service
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"DELETE"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPShouldHandleCookies:YES];
    
    NSURLConnection *connexion = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!connexion) {
        NSLog(@"Erreur de connexion");
    }
}

- (NSArray *)unvoteQuestion {
    NSLog(@"Return DataWs Unvote question");
    return dataWS;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    NSLog(@"Status code ws_post : %d", [httpResponse statusCode]);
    
    //    if ([httpResponse statusCode] == 201) {
    //        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //        NSString *checkAuth = [defaults stringForKey:@"logged"];
    //        if ([checkAuth isEqualToString:@"FALSE"]) {
    //            [defaults setObject:@"TRUE" forKey:@"logged"];
    //            [defaults synchronize];
    //        }
    //    }
    //    else {
    //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec" message:@"Nom d'utilisateur ou mot de passe incorrect" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    //        [alert show];
    //    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *dataResponse = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *datas = [dataResponse componentsSeparatedByString:@"\""];
    NSLog(@"DID RECEIVED DATA : %@",datas);
}

@end