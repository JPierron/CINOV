//
//  PartenairesVC.h
//  CINOV
//
//  Created by Jean Pierron on 4/24/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PartenairesVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *fichesPartners;

@end
