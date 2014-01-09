//
//  MessagerieView.m
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "MessagerieView.h"
//#import "NSAuthAlertView.h"
//#import "Base64.h"
//#import "RegisteringEvent.h"

@implementation MessagerieView

- (id)initWithFrame:(CGRect)frame dataWS:(NSMutableArray *)dataWS idrow:(int)idrow
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSMutableDictionary *datas = (NSMutableDictionary *) dataWS;
//        NSString *idEvent = [datas objectForKey:@"id"];
//        int idTag = [idEvent intValue];
//        int heigth = 40;
        
        UILabel *firstNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 90, 20)];
        firstNameLabel.numberOfLines = 0;
        firstNameLabel.text = [datas objectForKey:@"firstName"];
        //firstNameLabel.tag = 500;
        firstNameLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
        firstNameLabel.textColor = [UIColor darkGrayColor];
        firstNameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:firstNameLabel];
        
        
        UILabel *lastNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 20, 100, 20)];
        lastNameLabel.numberOfLines = 0;
        lastNameLabel.text = [datas objectForKey:@"lastName"];
        //lastNameLabel.tag = 1000;
        lastNameLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
        lastNameLabel.textColor = [UIColor darkGrayColor];
        lastNameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:lastNameLabel];
        
        UILabel *companyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 50, 120, 20)];
        companyNameLabel.numberOfLines = 0;
        companyNameLabel.text = [datas objectForKey:@"companyName"];
        //companyNameLabel.tag = 500;
        companyNameLabel.font = [UIFont fontWithName:@"Helvetica-Oblique" size:15.0];
        companyNameLabel.textColor = [UIColor darkGrayColor];
        companyNameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:companyNameLabel];
        
    }
    return self;
}

//- (IBAction)registeredButtonPressed:(id)sender registeredButton:(UIButton *)registeredButton {
//    
//    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *isLogged = [defaults stringForKey:@"logged"];
//    if ([isLogged isEqualToString:@"FALSE"]) {
//        NSLog(@"test button pressed ID : %d", [sender tag]);
//        [self showMessage:sender];
//    }
//    else {
//        // Authentification au WS ws_delete_event
//        NSLog(@"Enregistrement au WS ws_put_event de l'event : TAG = %d", [sender tag]);
//        RegisteringEvent *registered = [[RegisteringEvent alloc] initWithTag:[sender tag]];
//        NSLog(@"Registered : %@", registered);
//        
//    }
//}
//






// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//   
//}


@end
