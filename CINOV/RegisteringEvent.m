//
//  RegisteringEvent.m
//  CINOV
//
//  Created by Yoann BRAVI on 11/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "RegisteringEvent.h"

@implementation RegisteringEvent

@synthesize idEventRegister;

- (id)init
{
    if ((self = [super init]))
    {

    }
    return self;
}

- (id)initWithTag:(int)tag
{
    [self registerEvent:tag];
    return self;
}

- (void)registerEvent:(int)tag
{
    int idEvent = tag - 100000;
    
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
    [request setHTTPMethod:@"PUT"];
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
    NSLog(@"STATUS CODE : %d", [httpResponse statusCode]);
    
    
    // Status Code
    //
    // 201 : Crée
    // 401 : Non loggé
    // 400 : mauvais parametre
    // 409 : utilisateur est deja inscrit
    // 404 : ressource non trouvé
    // 405 : methode non implémenté
    
    if ([httpResponse statusCode] == 201) {
        UIAlertView *alertOk = [[UIAlertView alloc] initWithTitle:@"Vous venez de vous inscrire" message:@"Retrouver la liste de tous vos évènements dans Mon Planning" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertOk show];
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
