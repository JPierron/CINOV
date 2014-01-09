//
//  DateEvent.h
//  CINOV
//
//  Created by Yoann BRAVI on 02/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FicheEvent.h"
#import "TimeEvent.h"

@interface DateEvent : NSObject {
    NSArray *dataWS;
}

@property (strong) NSString *eventTimeStart;
@property (strong) NSString *eventTimeEnd;
@property (strong) NSString *eventName;
@property (strong) NSString *eventDesc;

- (id)init;
- (id)initWith:(NSString *)eventTimeStart eventTimeEnd:(NSString *)_eventTimeEnd eventName:(NSString *)_eventName eventDesc:(NSString *)_eventDesc;
- (void)wsGetEvents;
- (NSArray *)getEvents;

@end
