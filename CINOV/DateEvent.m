//
//  DateEvent.m
//  CINOV
//
//  Created by Yoann BRAVI on 02/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "DateEvent.h"
#import "FicheEvent.h"
#import "TimeEvent.h"

@implementation DateEvent

@synthesize eventTimeStart;
@synthesize eventTimeEnd;
@synthesize eventName;
@synthesize eventDesc;

- (id)init
{
    if ((self = [super init])) {        
        [self wsGetEvents];
    }
    return self;
}

- (id)initWith:(NSString *)_eventTimeStart eventTimeEnd:(NSString *)_eventTimeEnd eventName:(NSString *)_eventName eventDesc:(NSString *)_eventDesc {

    if ((self = [super init])) {       
        self.eventTimeStart = _eventTimeStart;
        self.eventTimeEnd = _eventTimeEnd;
        self.eventName = _eventName;
        self.eventDesc = _eventDesc;
    }
    return self;
}

- (void)wsGetEvents
{
    // Web service ws_get_events
    NSError *error;
    NSHTTPURLResponse *response;
    NSString *url = @"http://163.5.69.70/webapp/app_dev.php/webservice/events";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSData *conn = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"Status code WS ws_get_events : %d", [response statusCode]);
    
    
    dataWS = [NSJSONSerialization JSONObjectWithData:conn options:kNilOptions error:&error];

    NSLog(@"DATAWS : GET_EVENTS : %@", dataWS);
}

- (NSArray *)getEvents {
    return dataWS;
}

@end
