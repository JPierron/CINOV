//
//  unRegisteredEvent.m
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "unRegisteredEvent.h"

@implementation unRegisteredEvent

@synthesize idEventUnRegister;

- (id)init
{
    if ((self = [super init]))
    {
        
    }
    return self;
}

- (id)initWithTag:(int)tag
{
    [self unRegisterEvent:tag];
    return self;
}

- (void)unRegisterEvent:(int)tag
{
    int idEvent = tag - 110000;
    
    NSString *url = [NSString stringWithFormat:@"http://163.5.69.70/webapp/app_dev.php/webservice/events/%d", idEvent];
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

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"STATUS CODE ws_delete_event : %d", [httpResponse statusCode]);
    
    
    // Status Code
    //
    // 200 : Supprimé
    // 401 : Non loggé
    // 400 : mauvais parametre
    // 404 : ressource non trouvé
    // 405 : methode non implémenté
    
    if ([httpResponse statusCode] == 201) {

    }
    if ([httpResponse statusCode] == 409) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Vous êtes déja inscrit" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
}


@end
