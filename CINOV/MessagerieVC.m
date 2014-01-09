//
//  MessagerieVC.m
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "MessagerieVC.h"
#import "FicheReseauVC.h"
#import "BusinessCard.h"
#import "MBProgressHUD.h"

@interface MessagerieVC ()

@end

@implementation MessagerieVC

@synthesize dataWS;

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

}

- (void)parseUserJSON:(NSDictionary *)_dUser
{
    FicheContact *sample = [[FicheContact alloc] init];
    NSData* privacity = [_dUser objectForKey:@"privacity"];
    sample.name = [_dUser objectForKey:@"firstName"];
    sample.idUser = [[_dUser objectForKey:@"id"] integerValue];
    sample.surname = [_dUser objectForKey:@"lastName"];
    sample.mail.text = [_dUser objectForKey:@"email"];
    sample.phone.text = [_dUser objectForKey:@"phoneNumber"];
    sample.position.text = [_dUser objectForKey:@"job"];
    sample.company.text = [_dUser objectForKey:@"companyName"];
    ([[privacity valueForKey:@"email"] integerValue] == 1) ? [sample.mail setPrivacity:TRUE] : [sample.mail setPrivacity:FALSE];
    ([[privacity valueForKey:@"phone"] integerValue] == 1) ? [sample.phone setPrivacity:TRUE] : [sample.phone setPrivacity:FALSE];
    ([[privacity valueForKey:@"job"] integerValue] == 1) ? [sample.position setPrivacity:TRUE] : [sample.position setPrivacity:FALSE];
    ([[privacity valueForKey:@"company"] integerValue] == 1) ? [sample.company setPrivacity:TRUE] : [sample.company setPrivacity:FALSE];
    [self.fichesContacts addObject:sample];
}

- (void)viewWillAppear:(BOOL)animated
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
    BusinessCard *card = [[BusinessCard alloc] initWith:@"GET" userId:0];
         dispatch_async(dispatch_get_main_queue(), ^{
    dataWS = (NSMutableArray *) [card getCards];
   
    NSUInteger count = [self.dataWS count];
    self.fichesContacts = [[NSMutableArray alloc] initWithCapacity:count];
    for (NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *user = [self.dataWS objectAtIndex:i];
        [self parseUserJSON:user];
    }
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             [self.tableView reloadData];
         });
    });

    NSLog(@"DATA WS : %@ et count : %d", dataWS[1], [dataWS count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"DATA COUNT : %d", [dataWS count]);
    return [dataWS count];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Navigation logic may go here. Create and push another view controller.
    
    if([[segue identifier] isEqualToString:@"contactsToFiche"])
    {
        FicheReseauVC *ficheVC = segue.destinationViewController;
        FicheContact *fiche = [self.fichesContacts objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        ficheVC.ficheDetail = fiche;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"MessagerieCell"];
    FicheContact *fiche = [self.fichesContacts objectAtIndex:indexPath.row];
	UILabel *name = (UILabel *)[cell viewWithTag:91];
    name.text = [NSString stringWithFormat:@"%@ %@", fiche.surname, fiche.name];
	UILabel *company = (UILabel *)[cell viewWithTag:92];
    if ((fiche.company.status == FALSE && fiche.position.status == FALSE) || (fiche.company.text == NULL && fiche.position.text == NULL))
        company.text = @"-";
    else if (fiche.company.status == FALSE || fiche.company.text == NULL)
        company.text = fiche.position.text;
    else if (fiche.position.status == FALSE || fiche.position.text == NULL)
        company.text = fiche.company.text;
    else
        company.text = [NSString stringWithFormat:@"%@ à %@", fiche.position.text, fiche.company.text];
    //    UIImageView *pic = (UIImageView *) [cell viewWithTag:93];
    //    pic.image = (fiche.pic.status == TRUE) ? fiche.pic.image : [UIImage imageNamed:@"empty_avatar.png"];
    
    return cell;
}

@end
