//
//  ProfilVC.m
//  CINOV
//
//  Created by Jean Pierron on 4/24/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "ProfilVC.h"
#import "MonProfil.h"

@interface ProfilVC ()

@end

@implementation ProfilVC

@synthesize company;
@synthesize position;
@synthesize mail;
@synthesize phone;

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
    UIColor *background;
    switch (_HEIGHT_)
    {
        case 480:
            background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background2@2x.png"]];
        case 568:
            background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background2-568h@2x.png"]];
    }
    self.view.backgroundColor = background;
    
    MonProfil *profil = [[MonProfil alloc] init];
    NSMutableDictionary *array = (NSMutableDictionary *) [profil getUserLogged];
    
	company.text = [array objectForKey:@"companyName"];
    mail.text = [array objectForKey:@"email"];
    phone.text = [array objectForKey:@"phoneNumber"];
    position.text = [array objectForKey:@"job"];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
