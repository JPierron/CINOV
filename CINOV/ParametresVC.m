//
//  ParametresVC.m
//  CINOV
//
//  Created by Jean Pierron on 4/24/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "ParametresVC.h"
#import "HomeVC.h"
#import "Privacity.h"
#import "MonProfil.h"
#import "UpdateParam.h"

@interface ParametresVC ()

@end

@implementation ParametresVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    UIColor *background;
    switch (_HEIGHT_)
    {
        case 480:
            background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background2@2x.png"]];
        case 568:
            background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background2-568h@2x.png"]];
    }
    self.view.backgroundColor = background;
    self.mailSwitch.transform = CGAffineTransformMakeScale(0.76, 0.76);
    self.phoneSwitch.transform = CGAffineTransformMakeScale(0.76, 0.76);
    self.positionSwitch.transform = CGAffineTransformMakeScale(0.76, 0.76);
    self.companySwitch.transform = CGAffineTransformMakeScale(0.76, 0.76);

    self.profil = [[FicheContact alloc] init];
    MonProfil *profil = [[MonProfil alloc] init];
    NSMutableDictionary *array = (NSMutableDictionary *) [profil getUserLogged];
	self.profil.company.text = [array objectForKey:@"companyName"];
    self.profil.mail.text = [array objectForKey:@"email"];
    self.profil.phone.text = [array objectForKey:@"phoneNumber"];
    self.profil.position.text = [array objectForKey:@"job"];
    NSData* privacity = [array objectForKey:@"privacity"];
    NSLog(@" heheelllelleeeellooooo %@", privacity);
    ([[privacity valueForKey:@"email"] integerValue] == 1) ? [self.profil.mail setPrivacity:TRUE] : [self.profil.mail setPrivacity:FALSE];
    ([[privacity valueForKey:@"phone"] integerValue] == 1) ? [self.profil.phone setPrivacity:TRUE] : [self.profil.phone setPrivacity:FALSE];
    ([[privacity valueForKey:@"job"] integerValue] == 1) ? [self.profil.position setPrivacity:TRUE] : [self.profil.position setPrivacity:FALSE];
    ([[privacity valueForKey:@"company"] integerValue] == 1) ? [self.profil.company setPrivacity:TRUE] : [self.profil.company setPrivacity:FALSE];
    [self initView];
}


- (void)viewWillAppear:(BOOL)animated
{
    Privacity *privacity = [[Privacity alloc] initWith:@"GET"];
    NSMutableArray *array = (NSMutableArray *) [privacity getPrivacity];
    NSLog(@"Privacity : %@", array);
}


- (void)initView
{
    (self.profil.mail.status == TRUE) ? [self.mailSwitch setOn:YES] : [self.mailSwitch setOn:NO];
    (self.profil.phone.status == TRUE) ? [self.phoneSwitch setOn:YES] : [self.phoneSwitch setOn:NO];
    (self.profil.position.status == TRUE) ? [self.positionSwitch setOn:YES] : [self.positionSwitch setOn:NO];
    (self.profil.company.status == TRUE) ? [self.companySwitch setOn:YES] : [self.companySwitch setOn:NO];
    self.mailField.text = self.profil.mail.text;
    self.phoneField.text = self.profil.phone.text;
    self.positionField.text = self.profil.position.text;
    self.companyField.text = self.profil.company.text;
}

- (IBAction)cancel:(id)sender {
}

- (IBAction)valid:(id)sender {
    
    // ws_post_privacity
    // ws_update_user
    UpdateParam *update = [[UpdateParam alloc] init];
    
    
    
    
    NSLog(@"VALID BUTTON");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Navigation logic may go here. Create and push another view controller.
    
    if([[segue identifier] isEqualToString:@"parametersToHome"])
    {
    }
}

@end
