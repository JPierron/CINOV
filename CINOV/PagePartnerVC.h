//
//  PagePartnerVC.h
//  CINOV
//
//  Created by Jean Pierron on 5/15/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FichePartenaire.h"

@interface PagePartnerVC : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *pName;
@property (weak, nonatomic) IBOutlet UIWebView *pPage;

@property (strong, nonatomic) FichePartenaire *fichePartner;

@end
