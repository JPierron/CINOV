//
//  MessagerieVC.h
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FicheContact.h"

@interface MessagerieVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnHome;
@property (nonatomic, retain) NSMutableArray *dataWS;
@property (nonatomic, strong) NSMutableArray *fichesContacts;

@end
