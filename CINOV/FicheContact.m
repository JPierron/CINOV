//
//  FicheContact.m
//  CINOV
//
//  Created by Jean Pierron on 2/8/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "FicheContact.h"

@implementation FicheContact

@synthesize name;
@synthesize surname;
@synthesize company;
@synthesize position;
@synthesize mail;
@synthesize phone;
//@synthesize pic;
@synthesize idUser;

- (id) init
{
    if ((self = [super init]))
    {
        self.name = @"";
        self.surname = @"";
        self.mail = [[DisplayableString alloc] initWithTitle:@"" _status:TRUE];
        self.phone  = [[DisplayableString alloc] initWithTitle:@"" _status:TRUE];
        self.position = [[DisplayableString alloc] initWithTitle:@"" _status:TRUE];
        self.company = [[DisplayableString alloc] initWithTitle:@"" _status:TRUE];
//        self.pic = [[DisplayableImage alloc] initWithTitle:[UIImage imageNamed:@"Default.png"] _status:FALSE];
    }
    return self;
}

- (id) initAs:(FicheContact*)_model
{
    if ((self = [super init]))
    {
        self.idUser = _model.idUser;
        self.name = _model.name;
        self.surname = _model.surname;
        self.mail = [[DisplayableString alloc] initWithTitle:_model.mail.text _status:_model.mail.status];
        self.phone  = [[DisplayableString alloc] initWithTitle:_model.phone.text _status:_model.phone.status];
        self.position = [[DisplayableString alloc] initWithTitle:_model.position.text _status:_model.position.status];
        self.company = [[DisplayableString alloc] initWithTitle:_model.company.text _status:_model.company.status];
//        self.pic = [[DisplayableImage alloc] initWithTitle:_model.pic.image _status:_model.pic.status];
    }
    return self;
}

@end
