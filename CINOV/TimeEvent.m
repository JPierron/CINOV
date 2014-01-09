//
//  TimeEvent.m
//  CINOV
//
//  Created by Yoann BRAVI on 03/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "TimeEvent.h"

@implementation TimeEvent

@synthesize time;

- (id)init
{
    if ((self = [super init]))
    {
        self.time = [[NSArray alloc] initWithObjects:@"10h30", @"12h45", @"12233", @"kdj", nil];
    }
    return self;
}

- (id)initWith:(NSArray *)_time
{
    if ((self = [super init])) {
        self.time = _time;
    }
    return self;
}

@end
