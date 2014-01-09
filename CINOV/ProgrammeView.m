//
//  ProgrammeView.m
//  CINOV
//
//  Created by Yoann BRAVI on 27/04/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "ProgrammeView.h"
#import "NSAuthAlertView.h"
#import "Base64.h"
#import "RegisteringEvent.h"
#import "ProgrammeVC.h"

@implementation ProgrammeView

- (id)initWithFrame:(CGRect)frame dataWS:(NSMutableArray *)dataWS idrow:(int)idrow getNbDay:(NSArray *)nbEvenPerDay
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSMutableDictionary *datas = (NSMutableDictionary *) dataWS;
        NSString *idEvent = [datas objectForKey:@"id"];
        int idTag = [idEvent intValue];
        int heigth = 40;
        
        
            // Date de l'event
        
        NSString *nbDayString = [datas objectForKey:@"day"];
        int nbDay = [nbDayString intValue];
        if (nbDay == 1 && idrow == 0)
        {
            UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 5, 200, 20)];
            dateLabel.text = @"Jeudi 30 mai 2013";
            //dateLabel.tag = 1000000;
            dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
            dateLabel.textColor = [UIColor darkGrayColor];
            dateLabel.backgroundColor = [UIColor clearColor];
            
            [self addSubview:dateLabel];
        }
        if (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue]))
        {
            UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 5, 200, 20)];
            dateLabel.text = @"Vendredi 31 mai 2013";
            //dateLabel.tag = 1000000;
            dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
            dateLabel.textColor = [UIColor darkGrayColor];
            dateLabel.backgroundColor = [UIColor clearColor];

            [self addSubview:dateLabel];
        }
        if (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue])))
        {
            UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(152, 5, 200, 20)];
            dateLabel.text = @"Samedi 1 juin 2013";
            //dateLabel.tag = 1000000;
            dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
            dateLabel.textColor = [UIColor darkGrayColor];
            dateLabel.backgroundColor = [UIColor clearColor];
       
            [self addSubview:dateLabel];
        }

        
            // Heure de l'event
        
        NSDateFormatter *isoFormat = [[NSDateFormatter alloc] init];
        [isoFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
        NSString *createdDateStr = [datas objectForKey:@"started"];
        NSDate *date = [isoFormat dateFromString:createdDateStr];
        NSString *str = [NSString stringWithFormat:@"%@", date];
        NSArray *splitDay = [str componentsSeparatedByString:@" "];
        NSString *time = splitDay[1];
        NSArray *splitTime = [time componentsSeparatedByString:@":"];
        NSString *timeEvent = [NSString stringWithFormat:@"%@h%@", splitTime[0], splitTime[1]];
        
        if ((nbDay == 1 && idrow == 0) || (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue])) || (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue]))))
        {
            UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, heigth - 15, 300, 20)];
            timeLabel.text = timeEvent;
                //timeLabel.tag = 100000 + idTag;
            timeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
            timeLabel.textColor = [UIColor darkGrayColor];
            timeLabel.backgroundColor = [UIColor clearColor];
            [self addSubview:timeLabel];
        }
        else {
            UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, heigth - 35, 300, 20)];
            timeLabel.text = timeEvent;
                //timeLabel.tag = 100000 + idTag;
            timeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
            timeLabel.textColor = [UIColor darkGrayColor];
            timeLabel.backgroundColor = [UIColor clearColor];
            [self addSubview:timeLabel];
        }
        
        
            // Nom de l'event
        
        int more = 20;
        int nameLength = [[datas objectForKey:@"name"] length];
        if (nameLength > 40) {
            more = more + 16;
        }
        if (nameLength > 55) {
            more = more + 16;
        }

        if ((nbDay == 1 && idrow == 0) || (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue])) || (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue]))))
        {
            UILabel *eventDesc1Label = [[UILabel alloc] initWithFrame:CGRectMake(60, heigth + 5, 260, more)];
            eventDesc1Label.numberOfLines = 0;
            eventDesc1Label.text = [datas objectForKey:@"name"];
            //eventDesc1Label.tag = 500;
            eventDesc1Label.font = [UIFont fontWithName:@"Helvetica" size:13.0];
            eventDesc1Label.textColor = [UIColor darkGrayColor];
            eventDesc1Label.backgroundColor = [UIColor clearColor];
            [self addSubview:eventDesc1Label];
        }
        else
        {
            UILabel *eventDesc1Label = [[UILabel alloc] initWithFrame:CGRectMake(60, heigth - 15, 260, more)];
            eventDesc1Label.numberOfLines = 0;
            eventDesc1Label.text = [datas objectForKey:@"name"];
            //eventDesc1Label.tag = 500;
            eventDesc1Label.font = [UIFont fontWithName:@"Helvetica" size:13.0];
            eventDesc1Label.textColor = [UIColor darkGrayColor];
            eventDesc1Label.backgroundColor = [UIColor clearColor];
            [self addSubview:eventDesc1Label];
        }
        
        
            // Descripton de l'event
        
        int more2 = 20;
        int descLength = [[datas objectForKey:@"description"] length];
        if (descLength > 35) {
            more2 = more2 + 15;
        }
        if (descLength > 78) {
            more2 = more2 + 15;
        }
        if (descLength > 100) {
            more2 = more2 + 15;
        }
        if (descLength > 170) {
            more2 = more2 + 15;
        }

        if ((nbDay == 1 && idrow == 0) || (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue])) || (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue]))))
        {
            UILabel *eventDesc2Label = [[UILabel alloc] initWithFrame:CGRectMake(60, heigth - 10 + more, 260, more2)];
            eventDesc2Label.numberOfLines = 0;
            eventDesc2Label.text = [datas objectForKey:@"description"];
                //eventDesc2Label.tag = 1000;
            eventDesc2Label.font = [UIFont fontWithName:@"Helvetica-Oblique" size:12.0];
            eventDesc2Label.textColor = [UIColor darkGrayColor];
            eventDesc2Label.backgroundColor = [UIColor clearColor];
            [self addSubview:eventDesc2Label];
        }
        else
        {
            UILabel *eventDesc2Label = [[UILabel alloc] initWithFrame:CGRectMake(60, heigth - 20 + more, 260, more2)];
            eventDesc2Label.numberOfLines = 0;
            eventDesc2Label.text = [datas objectForKey:@"description"];
            //eventDesc2Label.tag = 1000;
            eventDesc2Label.font = [UIFont fontWithName:@"Helvetica-Oblique" size:12.0];
            eventDesc2Label.textColor = [UIColor darkGrayColor];
            eventDesc2Label.backgroundColor = [UIColor clearColor];
            [self addSubview:eventDesc2Label];
        }
        
            // Bouton inscription Event
        
        if ((nbDay == 1 && idrow == 0) || (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue])) || (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue]))))
        {
            UIButton *registeredButton = [[UIButton alloc] init];
            registeredButton = [UIButton buttonWithType:UIButtonTypeCustom];
            registeredButton.frame = CGRectMake(10, heigth, 40, 30);
            [registeredButton setTag: 100000 + idTag];
            [registeredButton setImage:[UIImage imageNamed:@"add_calendar.PNG"] forState:UIControlStateNormal];
            [registeredButton addTarget:self action:@selector(registeredButtonPressed:registeredButton:) forControlEvents:UIControlEventTouchUpInside];
            registeredButton.userInteractionEnabled = YES;
            [self addSubview:registeredButton];
            
            UIButton *qButton = [[UIButton alloc] init];
            qButton = [UIButton buttonWithType:UIButtonTypeCustom];
            qButton.frame = CGRectMake(280, heigth, 20, 15);
            [qButton setTag: 110000 + idTag];
            [qButton setImage:[UIImage imageNamed:@"arrow_left.PNG"] forState:UIControlStateNormal];
            [qButton addTarget:self action:@selector(qButtonPressed:qButton:) forControlEvents:UIControlEventTouchUpInside];
            qButton.userInteractionEnabled = YES;
            [self addSubview:qButton];

        }
        else
        {
            UIButton *registeredButton = [[UIButton alloc] init];
            registeredButton = [UIButton buttonWithType:UIButtonTypeCustom];
            registeredButton.frame = CGRectMake(10, heigth - 20, 40, 30);
            [registeredButton setTag: 100000 + idTag];
            [registeredButton setImage:[UIImage imageNamed:@"add_calendar.PNG"] forState:UIControlStateNormal];
            [registeredButton addTarget:self action:@selector(registeredButtonPressed:registeredButton:) forControlEvents:UIControlEventTouchUpInside];
            registeredButton.userInteractionEnabled = YES;
            [self addSubview:registeredButton];
            
            UIButton *qButton = [[UIButton alloc] init];
            qButton = [UIButton buttonWithType:UIButtonTypeCustom];
            qButton.frame = CGRectMake(280, heigth - 20, 20, 15);
            [qButton setTag: 110000 + idTag];
            [qButton setImage:[UIImage imageNamed:@"arrow_left.PNG"] forState:UIControlStateNormal];
            [qButton addTarget:self action:@selector(qButtonPressed:qButton:) forControlEvents:UIControlEventTouchUpInside];
            qButton.userInteractionEnabled = YES;
            [self addSubview:qButton];

        }
        
            // Bar separation Event
        
        if ((nbDay == 1 && idrow == 0) || (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue])) || (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue]))))
        {
            UIImageView *separation = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"separation.PNG"]];
            separation.frame = CGRectMake(40, heigth + more + more2 + 10, 240, 2);
            separation.backgroundColor = [UIColor darkGrayColor];
            [self addSubview:separation];
        }
        else
        {
            UIImageView *separation = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"separation.PNG"]];
            separation.frame = CGRectMake(40, heigth + more + more2, 240, 2);
            separation.backgroundColor = [UIColor darkGrayColor];
            [self addSubview:separation];
        }
        
    }
    return self;
}

- (IBAction)registeredButtonPressed:(id)sender registeredButton:(UIButton *)registeredButton {

    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *isLogged = [defaults stringForKey:@"logged"];
    if ([isLogged isEqualToString:@"FALSE"]) {
        NSLog(@"test button pressed ID : %d", [sender tag]);
        [self showMessage:sender];
    }
    else {
        // Authentification au WS ws_delete_event
        NSLog(@"Enregistrement au WS ws_put_event de l'event : TAG = %d", [sender tag]);
        RegisteringEvent *registered = [[RegisteringEvent alloc] initWithTag:[sender tag]];
        NSLog(@"Registered : %@", registered);
        
    }
}

- (IBAction)qButtonPressed:(id)sender qButton:(UIButton *)qButton
{
//    [self performSegueWithIdentifier:@"progToquestion" sender:ah je sa];
//    ProgrammeVC *progVC = [[ProgrammeVC alloc] init];
//    [progVC performSegueWithIdentifier:@"progToquestion" sender:progVC];
}

- (IBAction)showMessage:(id)sender {
    NSAuthAlertView *message = [[NSAuthAlertView alloc] initWithTitle:@"Authentification requise" message:@"Veuillez saisir votre nom d'utilisateur et mot de passe" delegate:self viewTag:[sender tag]];
    [message show];
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

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//   
//}


@end
