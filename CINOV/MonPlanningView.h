//
//  MonPlanningView.h
//  CINOV
//
//  Created by Yoann BRAVI on 12/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonPlanningView : UIView

- (id)initWithFrame:(CGRect)frame allEvents:(NSMutableArray *)allEvents idrow:(int)idrow getNbDay:(NSArray *)nbEventPerDay noEvent:(NSString *)noEvent;
- (IBAction)unRegisteredButtonPressed:(id)sender unRegisteredButton:(UIButton *)unRegisteredButton;

@end
