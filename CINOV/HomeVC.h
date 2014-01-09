//
//  HomeVC.h
//  CINOV
//
//  Created by Jean Pierron on 4/18/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeVC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnCongres;
@property (weak, nonatomic) IBOutlet UIButton *btnProgramme;
@property (weak, nonatomic) IBOutlet UIButton *btnPlan;
@property (weak, nonatomic) IBOutlet UIButton *btnPlanning;
@property (weak, nonatomic) IBOutlet UIButton *btnReseau;
@property (weak, nonatomic) IBOutlet UIButton *btnPartenaires;
@property (weak, nonatomic) IBOutlet UIButton *btnProfil;
@property (weak, nonatomic) IBOutlet UIButton *btnParametres;
@property (weak, nonatomic) IBOutlet UIButton *btnMessagerie;

- (IBAction)buttonPlanningPressed:(UIButton *)sender;
- (IBAction)buttonReseauPressed:(UIButton *)sender;
- (IBAction)buttonMessageriePressed:(UIButton *)sender;
- (IBAction)buttonProfilPressed:(UIButton *)sender;
- (IBAction)buttonParametresPressed:(UIButton *)sender;

@end
