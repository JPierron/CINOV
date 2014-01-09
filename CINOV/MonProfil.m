//
//  MonProfil.m
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "MonProfil.h"

@implementation MonProfil

- (id)init
{
    if ((self = [super init])) {
        [self wsGetUserLogged];
    }
    return self;
}

- (void)wsGetUserLogged
{
    // Web service ws_get_user_logged
    NSError *error;
    NSHTTPURLResponse *response;
    NSString *url = @"http://163.5.69.70/webapp/app_dev.php/webservice/currentuser";
    
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
    NSLog(@"Status code WS ws_get_user_logged : %d et %lld", [response statusCode], [response expectedContentLength]);
    
    dataWS = [NSJSONSerialization JSONObjectWithData:conn options:kNilOptions error:&error];
    NSLog(@"DATAS WSSSSSS : get current user : %@", dataWS);
    
}

- (NSArray *)getUserLogged {
    return dataWS;
}

@end
