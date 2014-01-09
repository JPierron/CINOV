//
//  ReseauVC.h
//  CINOV
//
//  Created by Jean Pierron on 4/18/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReseauVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *btnHome;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *fichesReseau;

@property (nonatomic, strong) NSArray *wsData;

- (void) parseUserJSON:(NSDictionary *)_dUser;
- (void)WSGetUsers;

@end
