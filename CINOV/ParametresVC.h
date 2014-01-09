//
//  ParametresVC.h
//  CINOV
//
//  Created by Jean Pierron on 4/24/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FicheContact.h"

@interface ParametresVC : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *mailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *positionField;
@property (weak, nonatomic) IBOutlet UITextField *companyField;

@property (retain, nonatomic) IBOutlet UISwitch *mailSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *phoneSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *positionSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *companySwitch;

@property (strong, nonatomic) FicheContact *profil;

- (void) initView;

- (IBAction)cancel:(id)sender;
- (IBAction)valid:(id)sender;

@end
