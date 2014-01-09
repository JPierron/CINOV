//
//  MyScheduleEvent.h
//  CINOV
//
//  Created by Yoann BRAVI on 19/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyScheduleEvent : NSObject {
    NSArray *dataWS;
}

@property (strong) NSString *eventTimeStart;
@property (strong) NSString *eventTimeEnd;
@property (strong) NSString *eventName;
@property (strong) NSString *eventDesc;

- (id)init;
- (id)initWith:(NSString *)eventTimeStart eventTimeEnd:(NSString *)_eventTimeEnd eventName:(NSString *)_eventName eventDesc:(NSString *)_eventDesc;
- (void)wsGetSchedule;
- (NSArray *)getSchedule;

@end
