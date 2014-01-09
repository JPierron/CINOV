//
//  MonPlanningVC.h
//  CINOV
//
//  Created by Jean Pierron on 4/24/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonPlanningVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    int day1;
    int day2;
    int day3;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *allEvents;
@property (nonatomic, retain) NSString *noEvents;

@end
