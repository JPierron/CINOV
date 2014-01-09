//
//  ProgrammeVC.h
//  CINOV
//
//  Created by Jean Pierron on 4/24/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgrammeVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    int day1;
    int day2;
    int day3;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnHome;
@property (nonatomic, retain) NSMutableArray *questionWS;
@property (nonatomic, retain) NSMutableArray *dataWS;


@end
