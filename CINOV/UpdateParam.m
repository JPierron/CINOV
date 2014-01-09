//
//  UpdateParam.m
//  CINOV
//
//  Created by Yoann BRAVI on 21/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "UpdateParam.h"

@implementation UpdateParam

- (id)init
{
    if ((self = [super init])) {
        [self wsUpdateParam];
    }
    return self;
}

- (void)wsUpdateParam
{
        // Web service ws_update_user
    
    NSError *error;
    
    NSString *url = @"http://163.5.69.70/webapp/app_dev.php/webservice/users";
    
        //
        //
        // ICI DATA POUR HTTP BODY
        // DANS userBody (tu mets les datas du user de la meme facon que tu les recuperes je penses)
        //
        //
    
    NSString *userBody = @"pojdpoaijdap";
    NSString *userBodyName = @"user";
    
    NSDictionary *jsonEncodeBody = [NSDictionary dictionaryWithObjectsAndKeys:userBody, userBodyName, nil];
    NSData *dataJSON = [NSJSONSerialization dataWithJSONObject:jsonEncodeBody options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:dataJSON encoding:NSUTF8StringEncoding];

    
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
    NSData *postData = [jsonString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"PUT"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPShouldHandleCookies:YES];
    [request setHTTPBody:postData];
    
    NSURLConnection *connexion = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!connexion) {
        NSLog(@"Erreur de connexion");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    NSLog(@"Status code ws_update_user : %d", [httpResponse statusCode]);
    
        if ([httpResponse statusCode] == 201) {
            // OK
        }  
}





@end