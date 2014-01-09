//
//  DisplayableImage.m
//  CINOV
//
//  Created by Jean Pierron on 2/9/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "DisplayableImage.h"

@implementation DisplayableImage

@synthesize image;
@synthesize status;

- (id) init
{
    if ((self = [super init]))
    {
        self.image = NULL;
        self.status = TRUE;
    }
    return self;
}

- (id) initWithTitle:(UIImage *)_image _status:(BOOL)_status
{
    if ((self = [super init]))
    {
        self.image = [UIImage alloc];
        self.image = _image;
        self.status = _status;
    }
    return self;
}

@end
