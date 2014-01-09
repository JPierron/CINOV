//
//  HomeVC.m
//  CINOV
//
//  Created by Jean Pierron on 4/18/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _QUEUE_ dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define _EVENTS_ [NSURL URLWithString:@"http://163.5.69.70/webapp/app_dev.php/webservice/users"]
#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "HomeVC.h"
#import "Base64.h"
#import "DateEvent.h"
#import "NSAuthAlertView.h"
#import "MonPlanningVC.h"
#import "MBProgressHUD.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    UIColor *background;
    switch (_HEIGHT_)
    {
        case 480:
            background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background@2x.png"]];
        case 568:
            background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background-568h@2x.png"]];
    }
    self.view.backgroundColor = background;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *checkAuth = [defaults stringForKey:@"logged"];
    if (checkAuth == nil) {
        [defaults setObject:@"FALSE" forKey:@"logged"];
        [defaults synchronize];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (IBAction)buttonPlanningPressed:(UIButton *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"logged"] isEqualToString:@"FALSE"]) {
        NSAuthAlertView *message = [[NSAuthAlertView alloc] initWithTitle:@"Authentification requise" message:@"Veuillez saisir votre nom d'utilisateur et mot de passe" delegate:self viewTag:[sender tag]];
        [message show];
    }
    else {

        [self performSegueWithIdentifier:@"MonPlanning" sender:self];
    }
}

- (IBAction)buttonReseauPressed:(UIButton *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"logged"] isEqualToString:@"FALSE"]) {
        NSAuthAlertView *message = [[NSAuthAlertView alloc] initWithTitle:@"Authentification requise" message:@"Veuillez saisir votre nom d'utilisateur et mot de passe" delegate:self viewTag:[sender tag]];
        [message show];
    }
    else {
        [self performSegueWithIdentifier:@"Reseau" sender:self];
    }
}

- (IBAction)buttonMessageriePressed:(UIButton *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"logged"] isEqualToString:@"FALSE"]) {
        NSAuthAlertView *message = [[NSAuthAlertView alloc] initWithTitle:@"Authentification requise" message:@"Veuillez saisir votre nom d'utilisateur et mot de passe" delegate:self viewTag:[sender tag]];
        [message show];
    }
    else {
        [self performSegueWithIdentifier:@"Messagerie" sender:self];
    }
}

- (IBAction)buttonProfilPressed:(UIButton *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"logged"] isEqualToString:@"FALSE"]) {
        NSAuthAlertView *message = [[NSAuthAlertView alloc] initWithTitle:@"Authentification requise" message:@"Veuillez saisir votre nom d'utilisateur et mot de passe" delegate:self viewTag:[sender tag]];
        [message show];
    }
    else {
        [self performSegueWithIdentifier:@"Profil" sender:self];
    }

}

- (IBAction)buttonParametresPressed:(UIButton *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"logged"] isEqualToString:@"FALSE"]) {
        NSAuthAlertView *message = [[NSAuthAlertView alloc] initWithTitle:@"Authentification requise" message:@"Veuillez saisir votre nom d'utilisateur et mot de passe" delegate:self viewTag:[sender tag]];
        [message show];
    }
    else {
        [self performSegueWithIdentifier:@"Parametres" sender:self];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSMutableArray *data;
    NSMutableDictionary *credential = [[NSMutableDictionary alloc] initWithCapacity:2];
    int tmp = 0;
    
    if (buttonIndex != 0) {
        for (UIView *view in alertView.subviews)
        {
            if ([view isKindOfClass:[UITextField class]]) {
                UITextField *textfield = (UITextField *) view;
                [data addObject:textfield.text == nil ? @"" : textfield.text];
                if (tmp == 0) {
                    if (textfield.text) {
                        [credential setObject:textfield.text forKey:@"username"];
                    }
                    else {
                        [credential setObject:@"" forKey:@"username"];
                    }
                }
                else {
                    if (textfield.text) {
                        [credential setObject:textfield.text forKey:@"password"];
                    }
                    else {
                        [credential setObject:@"" forKey:@"password"];
                    }
                }
                tmp++;
            }
        }
    }
    
    // Authentification au WS ws_auth
    
    if (([credential objectForKey:@"username"] != nil) && ([credential objectForKey:@"password"] != nil)) {
        
        NSError *error = nil;
        NSString *loginPasswd = [NSString stringWithFormat:@"%@:%@", [credential objectForKey:@"username"], [credential objectForKey:@"password"]];
        NSString *url = @"http://163.5.69.70/webapp/app_dev.php/webservice/auth";
        NSString *tokenName = @"auth_token";
        NSString *token;
        
        // Serialisation du token en Base 64 pour l'envoi dans le body HTTP
        NSData *base64 = [[NSData alloc] init];
        base64 = (NSData *) loginPasswd;
        token = [base64 base64EncodedString];
        
        NSDictionary *jsonEncodeBody = [NSDictionary dictionaryWithObjectsAndKeys:token, tokenName, nil];
        NSData *dataJSON = [NSJSONSerialization dataWithJSONObject:jsonEncodeBody options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:dataJSON encoding:NSUTF8StringEncoding];
        
        
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
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPShouldHandleCookies:YES];
        [request setHTTPBody:postData];
        
        NSURLConnection *connexion = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        if (!connexion) {
            NSLog(@"Erreur de connexion");
        }
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    if ([httpResponse statusCode] == 201) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *checkAuth = [defaults stringForKey:@"logged"];
        if ([checkAuth isEqualToString:@"FALSE"]) {
            [defaults setObject:@"TRUE" forKey:@"logged"];
            [defaults synchronize];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec" message:@"Nom d'utilisateur ou mot de passe incorrect" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *dataResponse = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *datas = [dataResponse componentsSeparatedByString:@"\""];
    if (![dataResponse isEqualToString:@"{\"error\":\"Wrong password\"}"]) {
        
        NSArray *userSplit = [datas[6] componentsSeparatedByString:@":"];
        NSString *user = userSplit[1];
        NSArray *userSplitId = [user componentsSeparatedByString:@"}"];
        NSString *userId = userSplitId[0];
        NSString *token = datas[3];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:userId forKey:@"user_id"];
        [defaults setObject:token forKey:@"token"];
        [defaults synchronize];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
