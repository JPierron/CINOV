//
//  FicheContactsVC.h
//  CINOV
//
//  Created by Jean Pierron on 5/21/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FicheContact.h"

@interface FicheMessVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *contactName;
@property (weak, nonatomic) IBOutlet UIImageView *contactPic;
@property (weak, nonatomic) IBOutlet UILabel *contactCompany;
@property (weak, nonatomic) IBOutlet UILabel *contactPosition;
@property (weak, nonatomic) IBOutlet UILabel *contactMail;
@property (weak, nonatomic) IBOutlet UILabel *contactPhone;

@property (weak, nonatomic) IBOutlet UIButton *bntHome;

@property (weak, nonatomic) IBOutlet UIButton *btnMail;
@property (weak, nonatomic) IBOutlet UIButton *btnPhone;
@property (weak, nonatomic) IBOutlet UIButton *btnReseau;

@property (strong, nonatomic) FicheContact *ficheDetail;

- (void) setString:(UILabel*)_label _data:(DisplayableString*)_data;
- (void) setImage:(UIImageView*)_img _data:(DisplayableImage*)_data;

- (IBAction)buttonMessagePressed:(UIButton *)sender;
- (IBAction)buttonEmailPressed:(UIButton *)sender;
- (IBAction)buttonReseauPressed:(UIButton *)sender;

@end
