//
//  FicheEvent.m
//  CINOV
//
//  Created by Yoann BRAVI on 25/04/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "FicheEvent.h"

@implementation FicheEvent

@synthesize event;
@synthesize description;

- (id)init {
    if ((self = [super init]))
    {
        self.event = @"Acceuil des congressistes et visite des stands des partenaires";
        self.description = @"Description";
    }

    return self;
}

- (id)initWith:(NSString *)_event _description:(NSString *)_description {
    if ((self = [super init]))
    {
        self.event = _event;
        self.description = _description;
    }
    return self;
}

@end
