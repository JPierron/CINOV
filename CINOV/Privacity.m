//
//  Privacity.m
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "Privacity.h"

@implementation Privacity

- (id)init
{
    if ((self = [super init])) {
        
    }
    return self;
}

- (id)initWith:(NSString *)method {
    
    if ((self = [super init])) {
        if ([method isEqualToString:@"GET"]) {
            [self wsGetPrivacity];
        }
        if ([method isEqualToString:@"POST"]) {
            [self wsPostPrivacity];
        }
    }
    return self;
}

- (void)wsGetPrivacity
{
    // Web service ws_get_privacity
    NSError *error;
    NSHTTPURLResponse *response;
    NSString *url = @"http://163.5.69.70/webapp/app_dev.php/webservice/settings";
    
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
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    [request setHTTPShouldHandleCookies:YES];
    NSData *conn = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"Status code WS ws_get_privacity : %d", [response statusCode]);
    
    dataWS = [NSJSONSerialization JSONObjectWithData:conn options:kNilOptions error:&error];
}

- (NSArray *)getPrivacity {
    return dataWS;
}

- (void)wsPostPrivacity
{
    NSString *url = @"http://163.5.69.70/webapp/app_dev.php/webservice/settings";
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

- (NSArray *)postPrivacity {
    NSLog(@"Return DataWs");
    return dataWS;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    NSLog(@"Status code ws_post_privacity : %d", [httpResponse statusCode]);
    
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
    
}

@end