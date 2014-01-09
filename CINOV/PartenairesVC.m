//
//  PartenairesVC.m
//  CINOV
//
//  Created by Jean Pierron on 4/24/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "PartenairesVC.h"
#import "FichePartenaire.h"
#import "PagePartnerVC.h"

@interface PartenairesVC ()

@end

@implementation PartenairesVC

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Navigation logic may go here. Create and push another view controller.
    
    if([[segue identifier] isEqualToString:@"partnersToPage"])
    {
        PagePartnerVC *pageVC = segue.destinationViewController;
        FichePartenaire *fiche = [self.fichesPartners objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        pageVC.fichePartner = fiche;
    }
}

// TableView Functions
#pragma mark - Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    self.title = @"Réseau";
    
    FichePartenaire *p1 = [[FichePartenaire alloc] initWith:@"CREA" _pL:@"http://www.creaonweb.com/crea-risque-assurance.html" _l:[UIImage imageNamed:@"crea.original.png"]];
    FichePartenaire *p2 = [[FichePartenaire alloc] initWith:@"EDF" _pL:@"http://www.edf.com/le-groupe-edf-3.html" _l:[UIImage imageNamed:@"edf.original.png"]];
    FichePartenaire *p3 = [[FichePartenaire alloc] initWith:@"EUROMAF" _pL:@"http://www.euromaf.fr/" _l:[UIImage imageNamed:@"euromaf-1.original.png"]];
    FichePartenaire *p4 = [[FichePartenaire alloc] initWith:@"MALAKOFF MÉDÉRIC" _pL:@"http://www.malakoffmederic.com/index.jsp" _l:[UIImage imageNamed:@"logo-malakoff-mederic.png"]];
    FichePartenaire *p5 = [[FichePartenaire alloc] initWith:@"EPITECH" _pL:@"http://www.epitech.eu/" _l:[UIImage imageNamed:@"epitech.original.png"]];
    FichePartenaire *p6 = [[FichePartenaire alloc] initWith:@"INTERFIMO" _pL:@"http://www.interfimo.fr/" _l:[UIImage imageNamed:@"interfimo-1.original.png"]];
    FichePartenaire *p7 = [[FichePartenaire alloc] initWith:@"IPTIC" _pL:@"http://www.iptic.fr/" _l:[UIImage imageNamed:@"iptic-2.original.png"]];
    FichePartenaire *p8 = [[FichePartenaire alloc] initWith:@"ISQ" _pL:@"http://www.isqualification.com/page-opqcm-presentation.htm" _l:[UIImage imageNamed:@"isq.original.png"]];
    FichePartenaire *p9 = [[FichePartenaire alloc] initWith:@"KAREKO" _pL:@"http://www.kareko.fr/" _l:[UIImage imageNamed:@"kareko.original.png"]];
    FichePartenaire *p10 = [[FichePartenaire alloc] initWith:@"OPQIBI" _pL:@"http://www.opqibi.com/" _l:[UIImage imageNamed:@"07-logo-opqibi-2007.original.jpg"]];
    FichePartenaire *p11 = [[FichePartenaire alloc] initWith:@"PYTHIE" _pL:@"http://www.pythie.fr/" _l:[UIImage imageNamed:@"pythie.original.png"]];
    FichePartenaire *p12 = [[FichePartenaire alloc] initWith:@"SNBPE" _pL:@"http://www.snbpe.org/" _l:[UIImage imageNamed:@"logo-snbpe.original.jpg"]];
    FichePartenaire *p13 = [[FichePartenaire alloc] initWith:@"SMABTP" _pL:@"http://www.smabtp.fr/SGM/jcms/c_5642/fr/accueil" _l:[UIImage imageNamed:@"groupe-smabtp.original.png"]];
    FichePartenaire *p14 = [[FichePartenaire alloc] initWith:@"LAFARGE" _pL:@"http://www.lafarge.fr" _l:[UIImage imageNamed:@"logo-lafarge.original.jpg"]];
    FichePartenaire *p15 = [[FichePartenaire alloc] initWith:@"MONTMIRAIL" _pL:@"http://www.montmirail.com" _l:[UIImage imageNamed:@"logo-montmirail-courtier-assu.original.jpg"]];
    FichePartenaire *p16 = [[FichePartenaire alloc] initWith:@"3D-ÉVOLUTION" _pL:@"http://www.3d-evolution.fr/" _l:[UIImage imageNamed:@"logo-3d-evolution.original.jpg"]];

    NSMutableArray *ps = [NSMutableArray arrayWithObjects:p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16, nil];
    
    self.fichesPartners = ps;
    
    return self.fichesPartners.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"PartnerCell"];
    FichePartenaire *fiche = [self.fichesPartners objectAtIndex:indexPath.row];
	UILabel *name = (UILabel *)[cell viewWithTag:131];
    name.text = fiche.name;
    UIImageView *pic = (UIImageView *)
    [cell viewWithTag:132];
    pic.image = fiche.logo;
    
    return cell;
}

@end
