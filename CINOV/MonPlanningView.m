//
//  MonPlanningView.m
//  CINOV
//
//  Created by Yoann BRAVI on 12/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "MonPlanningView.h"
#import "unRegisteredEvent.h"

@implementation MonPlanningView

- (id)initWithFrame:(CGRect)frame allEvents:(NSMutableArray *)allEvents idrow:(int)idrow getNbDay:(NSArray *)nbEvenPerDay noEvent:(NSString *)noEvent
{
    self = [super initWithFrame:frame];
    if (self) {
        
        if ([noEvent isEqualToString:@"Vous n'êtes inscrit à aucun évènement"]) {
            UILabel *noEvent = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 320, 80)];
            noEvent.text = (NSString *) allEvents;
            noEvent.numberOfLines = 0;
                //dateLabel.tag = 1000000;
            noEvent.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.5];
            noEvent.textColor = [UIColor darkGrayColor];
            noEvent.backgroundColor = [UIColor clearColor];
            
            [self addSubview:noEvent];
            return self;
        }
        
        
        NSMutableDictionary *datas = (NSMutableDictionary *) allEvents;
        NSString *idEvent = [datas objectForKey:@"id"];
        int idTag = [idEvent intValue];
        int heigth = 40;
        
        
            // Date de l'event
        
        NSString *nbDayString = [datas objectForKey:@"day"];
        int nbDay = [nbDayString intValue];
        if (nbDay == 1 && idrow == 0)
        {
            UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 5, 200, 20)];
            dateLabel.text = @"Jeudi 30 mai 2013";
                //dateLabel.tag = 1000000;
            dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
            dateLabel.textColor = [UIColor darkGrayColor];
            dateLabel.backgroundColor = [UIColor clearColor];
            
            [self addSubview:dateLabel];
        }
        if (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue]))
        {
            UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 5, 200, 20)];
            dateLabel.text = @"Vendredi 31 mai 2013";
                //dateLabel.tag = 1000000;
            dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
            dateLabel.textColor = [UIColor darkGrayColor];
            dateLabel.backgroundColor = [UIColor clearColor];
            
            [self addSubview:dateLabel];
        }
        if (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue])))
        {
            UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(152, 5, 200, 20)];
            dateLabel.text = @"Samedi 1 juin 2013";
                //dateLabel.tag = 1000000;
            dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
            dateLabel.textColor = [UIColor darkGrayColor];
            dateLabel.backgroundColor = [UIColor clearColor];
            
            [self addSubview:dateLabel];
        }
        
        
            // Heure de l'event
        
        NSDateFormatter *isoFormat = [[NSDateFormatter alloc] init];
        [isoFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
        NSString *createdDateStr = [datas objectForKey:@"started"];
        NSDate *date = [isoFormat dateFromString:createdDateStr];
        NSString *str = [NSString stringWithFormat:@"%@", date];
        NSArray *splitDay = [str componentsSeparatedByString:@" "];
        NSString *time = splitDay[1];
        NSArray *splitTime = [time componentsSeparatedByString:@":"];
        NSString *timeEvent = [NSString stringWithFormat:@"%@h%@", splitTime[0], splitTime[1]];
        
        if ((nbDay == 1 && idrow == 0) || (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue])) || (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue]))))
        {
            UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, heigth - 15, 300, 20)];
            timeLabel.text = timeEvent;
                //timeLabel.tag = 100000 + idTag;
            timeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
            timeLabel.textColor = [UIColor darkGrayColor];
            timeLabel.backgroundColor = [UIColor clearColor];
            [self addSubview:timeLabel];
        }
        else {
            UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, heigth - 35, 300, 20)];
            timeLabel.text = timeEvent;
                //timeLabel.tag = 100000 + idTag;
            timeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
            timeLabel.textColor = [UIColor darkGrayColor];
            timeLabel.backgroundColor = [UIColor clearColor];
            [self addSubview:timeLabel];
        }
        
        
            // Nom de l'event
        
        int more = 20;
        int nameLength = [[datas objectForKey:@"name"] length];
        if (nameLength > 40) {
            more = more + 16;
        }
        if (nameLength > 55) {
            more = more + 16;
        }

        if ((nbDay == 1 && idrow == 0) || (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue])) || (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue]))))
        {
            UILabel *eventDesc1Label = [[UILabel alloc] initWithFrame:CGRectMake(60, heigth + 5, 260, more)];
            eventDesc1Label.numberOfLines = 0;
            eventDesc1Label.text = [datas objectForKey:@"name"];
                //eventDesc1Label.tag = 500;
            eventDesc1Label.font = [UIFont fontWithName:@"Helvetica" size:13.0];
            eventDesc1Label.textColor = [UIColor darkGrayColor];
            eventDesc1Label.backgroundColor = [UIColor clearColor];
            [self addSubview:eventDesc1Label];
        }
        else
        {
            UILabel *eventDesc1Label = [[UILabel alloc] initWithFrame:CGRectMake(60, heigth - 15, 260, more)];
            eventDesc1Label.numberOfLines = 0;
            eventDesc1Label.text = [datas objectForKey:@"name"];
                //eventDesc1Label.tag = 500;
            eventDesc1Label.font = [UIFont fontWithName:@"Helvetica" size:13.0];
            eventDesc1Label.textColor = [UIColor darkGrayColor];
            eventDesc1Label.backgroundColor = [UIColor clearColor];
            [self addSubview:eventDesc1Label];
        }
        
        
            // Descripton de l'event
        
        int more2 = 20;
        int descLength = [[datas objectForKey:@"description"] length];
        if (descLength > 35) {
            more2 = more2 + 15;
        }
        if (descLength > 78) {
            more2 = more2 + 15;
        }
        if (descLength > 100) {
            more2 = more2 + 15;
        }
        if (descLength > 170) {
            more2 = more2 + 15;
        }

        if ((nbDay == 1 && idrow == 0) || (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue])) || (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue]))))
        {
            UILabel *eventDesc2Label = [[UILabel alloc] initWithFrame:CGRectMake(60, heigth + more, 260, more2)];
            eventDesc2Label.numberOfLines = 0;
            eventDesc2Label.text = [datas objectForKey:@"description"];
                //eventDesc2Label.tag = 1000;
            eventDesc2Label.font = [UIFont fontWithName:@"Helvetica-Oblique" size:12.0];
            eventDesc2Label.textColor = [UIColor darkGrayColor];
            eventDesc2Label.backgroundColor = [UIColor clearColor];
            [self addSubview:eventDesc2Label];
        }
        else
        {
            UILabel *eventDesc2Label = [[UILabel alloc] initWithFrame:CGRectMake(60, heigth - 10 + more, 260, more2)];
            eventDesc2Label.numberOfLines = 0;
            eventDesc2Label.text = [datas objectForKey:@"description"];
                //eventDesc2Label.tag = 1000;
            eventDesc2Label.font = [UIFont fontWithName:@"Helvetica-Oblique" size:12.0];
            eventDesc2Label.textColor = [UIColor darkGrayColor];
            eventDesc2Label.backgroundColor = [UIColor clearColor];
            [self addSubview:eventDesc2Label];
        }
        
            // Bouton inscription Event
        
        if ((nbDay == 1 && idrow == 0) || (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue])) || (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue]))))
        {
            UIButton *unRegisteredButton = [[UIButton alloc] init];
            unRegisteredButton = [UIButton buttonWithType:UIButtonTypeCustom];
            unRegisteredButton.frame = CGRectMake(10, heigth, 40, 30);
            [unRegisteredButton setTag: 110000 + idTag];
            [unRegisteredButton setImage:[UIImage imageNamed:@"remove_calendar.PNG"] forState:UIControlStateNormal];
            [unRegisteredButton addTarget:self action:@selector(unRegisteredButtonPressed:unRegisteredButton:) forControlEvents:UIControlEventTouchUpInside];
            unRegisteredButton.userInteractionEnabled = YES;
            [self addSubview:unRegisteredButton];
        }
        else
        {
            UIButton *unRegisteredButton = [[UIButton alloc] init];
            unRegisteredButton = [UIButton buttonWithType:UIButtonTypeCustom];
            unRegisteredButton.frame = CGRectMake(10, heigth - 20, 40, 30);
            [unRegisteredButton setTag: 110000 + idTag];
            [unRegisteredButton setImage:[UIImage imageNamed:@"remove_calendar.PNG"] forState:UIControlStateNormal];
            [unRegisteredButton addTarget:self action:@selector(unRegisteredButtonPressed:unRegisteredButton:) forControlEvents:UIControlEventTouchUpInside];
            unRegisteredButton.userInteractionEnabled = YES;
            [self addSubview:unRegisteredButton];
        }
        
            // Bar separation Event
        
        if ((nbDay == 1 && idrow == 0) || (nbDay == 2 && (idrow == [nbEvenPerDay[0] intValue])) || (nbDay == 3 && (idrow == ([nbEvenPerDay[0] intValue] + [nbEvenPerDay[1] intValue]))))
        {
            UIImageView *separation = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"separation.PNG"]];
            separation.frame = CGRectMake(40, heigth + more + more2 + 10, 240, 2);
            separation.backgroundColor = [UIColor darkGrayColor];
            [self addSubview:separation];
        }
        else
        {
            UIImageView *separation = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"separation.PNG"]];
            separation.frame = CGRectMake(40, heigth + more + more2, 240, 2);
            separation.backgroundColor = [UIColor darkGrayColor];
            [self addSubview:separation];
        }
        
    }
    return self;
}

- (IBAction)unRegisteredButtonPressed:(id)sender unRegisteredButton:(UIButton *)unRegisteredButton {
    
    
        // Authentification au WS ws_put_event
    NSLog(@"Suppression au WS ws_delete_event de l'event : TAG = %d", [sender tag]);

    unRegisteredEvent *unRegistered = [[unRegisteredEvent alloc] initWithTag:[sender tag]];

    NSLog(@"Registered : %@", unRegistered);

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
