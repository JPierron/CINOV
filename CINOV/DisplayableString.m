//
//  DisplayableString.m
//  CINOV
//
//  Created by Jean Pierron on 2/9/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "DisplayableString.h"

@implementation DisplayableString

@synthesize text;
@synthesize status;

- (id) init
{
    if ((self = [super init]))
    {
        self.text = @"";
        self.status = TRUE;
    }
    return self;
}

- (id) initWithTitle:(NSString *)_text _status:(BOOL)_status
{
    if ((self = [super init]))
    {
        self.text = [[NSString alloc] initWithFormat:@"%@", _text];
        self.status = _status;
    }
    return self;
}

- (void) setPrivacity:(BOOL)_pStatus
{
    self.status = _pStatus;
}

@end
