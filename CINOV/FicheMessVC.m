//
//  FicheContactsVC.m
//  CINOV
//
//  Created by Jean Pierron on 5/21/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "FicheMessVC.h"
#import "BusinessCard.h"

@class FicheContact;

@interface FicheMessVC ()

@end

@implementation FicheMessVC

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
    self.contactName.text = [NSString stringWithFormat:@"%@ %@", self.ficheDetail.surname, self.ficheDetail.name];
    [self setString:self.contactCompany _data:self.ficheDetail.company];
    [self setString:self.contactPosition _data:self.ficheDetail.position];
    [self setString:self.contactMail _data:self.ficheDetail.mail];
    [self setString:self.contactPhone _data:self.ficheDetail.phone];
    //    [self setImage:self.contactPic _data:self.ficheDetail.pic];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setString:(UILabel *)_label _data:(DisplayableString *)_data
{
    _label.text = (_data.status == TRUE) ? _data.text : @"-";
    _label.textColor = (_data.status == TRUE) ? [UIColor colorWithRed:59.0/255.0 green:59.0/255.0 blue:59.0/255.0 alpha:1.0] : [UIColor colorWithRed:229.0/255.0 green:6.0/255.0 blue:7.0/255.0 alpha:1.0];
}

- (void) setImage:(UIImageView *)_img _data:(DisplayableImage *)_data
{
    _img.image = (_data.status == TRUE) ? _data.image : [UIImage imageNamed:@"4a_emptyphoto.png"];
}

- (IBAction)buttonMessagePressed:(UIButton *)sender
{
    // Récupérer le numero de téléphone du user selectionné
    
    if (self.ficheDetail.phone.status == TRUE)
    {
        NSString *stringUrl = [NSString stringWithFormat:@"sms:%@", self.ficheDetail.phone.text];
        NSURL *url = [NSURL URLWithString:stringUrl];
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (IBAction)buttonEmailPressed:(UIButton *)sender
{
    // Récupérer l'adresse email du user selectionné
    
    //NSString *subject = @"Sujet du Mail";
    //NSString *body = @"Body du mail";
    //NSString *cc = @"Copie";
    if (self.ficheDetail.mail.status == TRUE)
    {
        NSString *path = [NSString stringWithFormat:@"mailto:%@", self.ficheDetail.mail.text];
        NSURL *url = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (IBAction)buttonReseauPressed:(UIButton *)sender
{
    NSLog(@"RESEAU PRESSED et TAG : %d", [sender tag]);
    
    // Il faut récupérer le tag du user selectionné dans réseau ou alors pouvoir recupere on id pour mettre dans userId.
    //
    // Envoyer carte de visite au user choisi
    //
    // Connection au Web Service ws_post_card
    
    BusinessCard *card = [[BusinessCard alloc] initWith:@"POST" userId:self.ficheDetail.idUser];
    [card postCards];
    NSLog(@"CARDS CARDS : %@", card);
    
}

@end

