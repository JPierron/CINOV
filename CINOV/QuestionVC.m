//
//  QuestionVC.m
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))
#import "QuestionVC.h"

@class QuestionEvent;

@interface QuestionVC ()

@end

@implementation QuestionVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIColor *background;
    switch (_HEIGHT_)
    {
        case 480:
            background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background2@2x.png"]];
        case 568:
            background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background2-568h@2x.png"]];
    }
    self.view.backgroundColor = background;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"TERRET %@", self.questionDetail);
    self.dateEvent.text = @"ICI recption du bon WS";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
