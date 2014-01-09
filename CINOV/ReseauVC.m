//
//  ReseauVC.m
//  CINOV
//
//  Created by Jean Pierron on 4/18/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _BG_QUEUE_ dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define _WS_USERS_ [NSURL URLWithString:@"http://163.5.69.70/webapp/app_dev.php/webservice/users"]
#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "ReseauVC.h"
#import "FicheReseauVC.h"
#import "FicheContact.h"
#import "MBProgressHUD.h"

@interface ReseauVC ()

@end

@implementation ReseauVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)WSGetUsers
{
    NSError *error;
    NSHTTPURLResponse *response;
    NSString *url = @"http://163.5.69.70/webapp/app_dev.php/webservice/users";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSData *conn = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"return get_users : %d", [response statusCode]);
    
    self.wsData = [NSJSONSerialization JSONObjectWithData:conn options:kNilOptions error:&error];
//    NSLog(@"GET_USERS : %@", self.wsData);
}

- (void)viewWillAppear:(BOOL)animated
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(_BG_QUEUE_, ^{
        NSData* data = [NSData dataWithContentsOfURL:
                        _WS_USERS_];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"ReseauVC called");
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Navigation logic may go here. Create and push another view controller.
    
    if([[segue identifier] isEqualToString:@"reseauToFiche"])
    {
        FicheReseauVC *ficheVC = segue.destinationViewController;
        FicheContact *fiche = [self.fichesReseau objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        ficheVC.ficheDetail = fiche;
    }
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
    [self.fichesReseau addObject:sample];
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    
    NSArray* users = (NSArray*) json;
    NSUInteger count = [users count];
    self.fichesReseau = [[NSMutableArray alloc] initWithCapacity:count];
    for (NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *user = [users objectAtIndex:i];
        [self parseUserJSON:user];
    }
    [self.tableView reloadData];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
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
    return self.fichesReseau.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"FicheCell"];
    FicheContact *fiche = [self.fichesReseau objectAtIndex:indexPath.row];
	UILabel *name = (UILabel *)[cell viewWithTag:101];
    name.text = [NSString stringWithFormat:@"%@ %@", fiche.surname, fiche.name];
	UILabel *company = (UILabel *)[cell viewWithTag:102];
    if ((fiche.company.status == FALSE && fiche.position.status == FALSE) || ([fiche.company.text isEqualToString:@""] == TRUE && [fiche.position.text isEqualToString:@""] == TRUE))
        company.text = @"-";
    else if (fiche.company.status == FALSE || [fiche.company.text isEqualToString:@""] == TRUE)
        company.text = fiche.position.text;
    else if (fiche.position.status == FALSE || [fiche.position.text isEqualToString:@""] == TRUE)
        company.text = fiche.company.text;
    else
        company.text = [NSString stringWithFormat:@"%@ à %@", fiche.position.text, fiche.company.text];
//    UIImageView *pic = (UIImageView *) [cell viewWithTag:103];
//    pic.image = (fiche.pic.status == TRUE) ? fiche.pic.image : [UIImage imageNamed:@"empty_avatar.png"];
    
    return cell;
}

@end
