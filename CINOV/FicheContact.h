//
//  FicheContact.h
//  CINOV
//
//  Created by Jean Pierron on 2/8/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DisplayableImage.h"
#import "DisplayableString.h"

@interface FicheContact : NSObject

@property (strong) NSString *name;
@property (strong) NSString *surname;
@property (strong) DisplayableString *company;
@property (strong) DisplayableString *mail;
@property (strong) DisplayableString *position;
@property (strong) DisplayableString *phone;
//@property (strong) DisplayableImage *pic;
@property NSUInteger idUser;

- (id) init;
- (id) initAs:(FicheContact*)_model;

@end
