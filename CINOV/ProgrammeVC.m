//
//  ProgrammeVC.m
//  CINOV
//
//  Created by Jean Pierron on 4/24/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "ProgrammeVC.h"
#import "DateEvent.h"
#import "ProgrammeView.h"
#import "Base64.h"
#import "QuestionVC.h"
#import "QuestionEvent.h"
#import "MBProgressHUD.h"

@interface ProgrammeVC ()

@end

@implementation ProgrammeVC

@synthesize questionWS;
@synthesize dataWS;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {}
    
//                [NSThread sleepForTimeInterval:3];
//                dataWS = arrayToSort;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"progToquestion"])
    {
        QuestionVC *questionVC = segue.destinationViewController;
        QuestionEvent *question = [self.questionWS objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        questionVC.questionDetail = question;
    }
}



- (void)viewWillAppear:(BOOL)animated
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        DateEvent *event = [[DateEvent alloc] init];
        dispatch_async(dispatch_get_main_queue(), ^{
        dataWS = (NSMutableArray *)[event getEvents];
        NSMutableArray *arrayToSort = [dataWS mutableCopy];
        NSSortDescriptor *descriptorDate = [[NSSortDescriptor alloc] initWithKey:@"day" ascending:YES];
        NSSortDescriptor *descriptorTime = [[NSSortDescriptor alloc] initWithKey:@"started" ascending:YES];
        [arrayToSort sortUsingDescriptors:[NSMutableArray arrayWithObjects:descriptorDate, descriptorTime, nil]];
        dataWS = arrayToSort;
        
        day1 = 0;
        day2 = 0;
        day3 = 0;
        NSUInteger count = [dataWS count];
        for (NSUInteger index = 0; index < count; index++) {
            if ([[[dataWS objectAtIndex:index] objectForKey:@"day"] intValue] == 1) {
                day1++;
            }
            if ([[[dataWS objectAtIndex:index] objectForKey:@"day"] intValue] == 2) {
                day2++;
            }
            if ([[[dataWS objectAtIndex:index] objectForKey:@"day"] intValue] == 3) {
                day3++;
            }
        }
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.tableView reloadData];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataWS count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell *)[tableView
                             dequeueReusableCellWithIdentifier:@"DayCell"];
    
    //Obligé de garder cette ligne sinon duplication des données partout HORRIBLE
    //Ducoup pas possible de faire une push segue sur Question

//    if (cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DayCell"];
        
        
//    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.tableView.separatorColor = [UIColor clearColor];
    
    NSMutableArray *day = [dataWS objectAtIndex:indexPath.row];
    NSMutableArray *nbDay = [[NSMutableArray alloc] initWithCapacity:3];
    [nbDay addObject:[NSString stringWithFormat:@"%d", day1]];
    [nbDay addObject:[NSString stringWithFormat:@"%d", day2]];
    [nbDay addObject:[NSString stringWithFormat:@"%d", day3]];
    
    ProgrammeView *eventView = [[ProgrammeView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) dataWS:day idrow:indexPath.row getNbDay:nbDay];
    [cell.contentView addSubview:eventView];
    
    //QuestionEvent *getQuestion = [[QuestionEvent alloc] init];
    
    //QuestionEvent *question = [self.questionWS objectAtIndex:indexPath.row];
    
    
    UILabel *name = (UILabel *)[cell viewWithTag:199];
    name.text = [NSString stringWithFormat:@"%@", @"yhuiiiibzjd"];
    return cell;
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    if (indexPath.row == 1) {
//        
//        return NO;
//    }
//    return YES;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int cellDefaultSize = 105.0;
    int cellHeigth;
    int nameHeigth = [[[dataWS objectAtIndex:indexPath.row] objectForKey:@"name"] length];
    int descHeigth = [[[dataWS objectAtIndex:indexPath.row] objectForKey:@"description"] length];
    if (indexPath.row == 0) {
        cellHeigth = cellDefaultSize + 20.0;
        if (nameHeigth > 38) {
            cellDefaultSize = cellDefaultSize + 16;
        }
        if (nameHeigth > 55) {
            cellDefaultSize = cellDefaultSize + 16;
        }
        if (descHeigth > 50) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        if (descHeigth > 87) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        if (descHeigth > 130) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        if (descHeigth > 170) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        return (cellDefaultSize + 20);
    }
    if (indexPath.row == day1) {
        cellHeigth = cellDefaultSize + 20.0;
        if (nameHeigth > 38) {
            cellDefaultSize = cellDefaultSize + 16;
        }
        if (nameHeigth > 55) {
            cellDefaultSize = cellDefaultSize + 16;
        }
        if (descHeigth > 50) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        if (descHeigth > 87) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        if (descHeigth > 130) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        if (descHeigth > 170) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        return (cellDefaultSize + 20);
    }
    if (indexPath.row == (day1 + day2)) {
        cellHeigth = cellDefaultSize + 20.0;
        if (nameHeigth > 38) {
            cellDefaultSize = cellDefaultSize + 16;
        }
        if (nameHeigth > 55) {
            cellDefaultSize = cellDefaultSize + 16;
        }
        if (descHeigth > 50) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        if (descHeigth > 87) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        if (descHeigth > 130) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        if (descHeigth > 170) {
            cellDefaultSize = cellDefaultSize + 15;
        }
        return (cellDefaultSize + 20);
    }
    if (nameHeigth > 38) {
        cellDefaultSize = cellDefaultSize + 16;
    }
    if (nameHeigth > 55) {
        cellDefaultSize = cellDefaultSize + 16;
    }
    if (descHeigth > 50) {
        cellDefaultSize = cellDefaultSize + 15;
    }
    if (descHeigth > 87) {
        cellDefaultSize = cellDefaultSize + 15;
    }
    if (descHeigth > 130) {
        cellDefaultSize = cellDefaultSize + 15;
    }
    if (descHeigth > 170) {
        cellDefaultSize = cellDefaultSize + 15;
    }
    return cellDefaultSize;
}


@end
