//
//  CongresDescrVC.m
//  CINOV
//
//  Created by Jean Pierron on 4/18/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "CongresDescrVC.h"

@interface CongresDescrVC ()

@end

@implementation CongresDescrVC

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
    self.congresDescr.text = @"Rendez-vous à Lyon les 30, 31 mai et 1er juin Dans 3 mois, les 30, 31 mai et 1er juin, nous nous retrouverons au congrès annuel de CINOV à Lyon, sur le thème de « La passion, l’énergie de l’entrepreneur ». Nous vous concoctons une plénière prometteuse, dont l’originalité sera d’être animée par Philippe FOURNIER, chef de l'orchestre symphonique Confluences, accompagné d'un quintette :    Avec la participation de :    - Père Bernard DEVERT, Président et fondateur d’Habitat et Humanisme : Foi et passion quelle différence ?    - Marie-Laure REYNAUD, associée du groupe Giraudet, Présidente de la délégation de Lyon des Femmes Chefs d'entreprises : Une femme est-elle un chef d'entreprise comme un autre ?    - Jean-Michel AULAS, Président de CEGID et de l'OL : Passion et métier : comment les faire cohabiter ?    Pour ce qui est des soirées, le jeudi nous verra arriver en bateau à Confluence pour une soirée décontractée et le vendredi nous fera sortir nos tenues de gala pour dîner à l’Abbaye de Collonges de Paul Bocuse.    D’ici quelques semaines, les programmes seront finalisés et les invitations envoyées avec un premier tarif valable jusqu’au 31 mars.    Nous vous recommandons de réserver dès maintenant votre hôtel. Vous trouverez sur le site internet, en plus d’une liste d’hôtels, dans votre espace adhérent CINOV, un code de réduction pour réserver dans un hôtel proche de la cité Internationale de Lyon.    Toute l’équipe de vos confrères et consœurs du comité d’organisation s’implique activement pour vous proposer des soirées et des journées inoubliables et nous nous préparons à l’immense plaisir de vous accueillir nombreux,    Michel Valette - Président de CINOV Rhône Alpes";

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
