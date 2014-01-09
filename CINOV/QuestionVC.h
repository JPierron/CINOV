//
//  QuestionVC.h
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionEvent.h"

@interface QuestionVC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *bntHome;

@property (strong, nonatomic) QuestionEvent *questionDetail;

@property (weak, nonatomic) IBOutlet UILabel *dateEvent;

@property (weak, nonatomic) IBOutlet UILabel *btnCompany;
@property (weak, nonatomic) IBOutlet UILabel *btnJob;
@property (weak, nonatomic) IBOutlet UILabel *btnEmail;
@property (weak, nonatomic) IBOutlet UILabel *btnPhone;
@end
