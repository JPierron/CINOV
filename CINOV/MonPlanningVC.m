//
//  MonPlanningVC.m
//  CINOV
//
//  Created by Jean Pierron on 4/24/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "MonPlanningVC.h"
#import "MonPlanningView.h"
#import "MyScheduleEvent.h"
#import "MBProgressHUD.h"

@interface MonPlanningVC ()

@end

@implementation MonPlanningVC
@synthesize allEvents;
@synthesize noEvents;

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

- (void)viewWillAppear:(BOOL)animated
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{

    MyScheduleEvent *scheduleEvent = [[MyScheduleEvent alloc] init];
        dispatch_async(dispatch_get_main_queue(), ^{
    allEvents = (NSMutableArray *)[scheduleEvent getSchedule];
     
    NSMutableArray *arrayToSort = [allEvents mutableCopy];
    NSSortDescriptor *descriptorDate = [[NSSortDescriptor alloc] initWithKey:@"day" ascending:YES];
    NSSortDescriptor *descriptorTime = [[NSSortDescriptor alloc] initWithKey:@"started" ascending:YES];
    [arrayToSort sortUsingDescriptors:[NSMutableArray arrayWithObjects:descriptorDate, descriptorTime, nil]];
    allEvents = arrayToSort;
    
    day1 = 0;
    day2 = 0;
    day3 = 0;
    NSUInteger count = [allEvents count];
    for (NSUInteger index = 0; index < count; index++) {
        if ([[[allEvents objectAtIndex:index] objectForKey:@"day"] intValue] == 1) {
            day1++;
        }
        if ([[[allEvents objectAtIndex:index] objectForKey:@"day"] intValue] == 2) {
            day2++;
        }
        if ([[[allEvents objectAtIndex:index] objectForKey:@"day"] intValue] == 3) {
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

// TableView Functions
#pragma mark - Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.noEvents = nil;

    if ([allEvents count] > 0) {
        return [allEvents count];
    }
    else {
        NSString *no = @"Vous n'êtes inscrit à aucun évènement";
        self.noEvents = no;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MonPlanningCell";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.tableView.separatorColor = [UIColor clearColor];
    
    if (noEvents) {
        NSMutableArray *arr = [NSMutableArray arrayWithObjects:noEvents, nil];
        NSMutableArray *day = [arr objectAtIndex:indexPath.row];
        NSMutableArray *nbDay = [[NSMutableArray alloc] initWithCapacity:3];
        [nbDay addObject:[NSString stringWithFormat:@"%d", day1]];
        [nbDay addObject:[NSString stringWithFormat:@"%d", day2]];
        [nbDay addObject:[NSString stringWithFormat:@"%d", day3]];
        MonPlanningView *eventView = [[MonPlanningView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) allEvents:day idrow:indexPath.row getNbDay:nbDay noEvent:noEvents];
        [cell.contentView addSubview:eventView];
    }
    else {
        NSMutableArray *day = [allEvents objectAtIndex:indexPath.row];
        NSMutableArray *nbDay = [[NSMutableArray alloc] initWithCapacity:3];
        [nbDay addObject:[NSString stringWithFormat:@"%d", day1]];
        [nbDay addObject:[NSString stringWithFormat:@"%d", day2]];
        [nbDay addObject:[NSString stringWithFormat:@"%d", day3]];
        MonPlanningView *eventView = [[MonPlanningView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) allEvents:day idrow:indexPath.row getNbDay:nbDay noEvent:noEvents];
        [cell.contentView addSubview:eventView];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int cellDefaultSize = 105.0;
    int cellHeigth;
    if (noEvents) {
        return 200.0;
    }
    int nameHeigth = [[[allEvents objectAtIndex:indexPath.row] objectForKey:@"name"] length];
    int descHeigth = [[[allEvents objectAtIndex:indexPath.row] objectForKey:@"description"] length];
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
