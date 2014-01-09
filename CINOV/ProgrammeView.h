//
//  ProgrammeView.h
//  CINOV
//
//  Created by Yoann BRAVI on 27/04/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgrammeView : UIView {

}

- (id)initWithFrame:(CGRect)frame dataWS:(NSMutableArray *)dataWS idrow:(int)idrow getNbDay:(NSArray *)nbEventPerDay;
- (IBAction)registeredButtonPressed:(id)sender registeredButton:(UIButton *)registeredButton;
- (IBAction)qButtonPressed:(id)sender qButton:(UIButton *)qButton;
- (IBAction)showMessage:(id)sender;

@end
