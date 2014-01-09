//
//  FichePartenaire.m
//  CINOV
//
//  Created by Jean Pierron on 5/15/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "FichePartenaire.h"

@implementation FichePartenaire

- (id) init
{
    return self;
}

- (id) initWith:(NSString *)_n _pL:(NSString *)_pL _l:(UIImage *)_l
{
    if ((self = [super init]))
    {
        self.name = _n;
        self.pageLink = _pL;
        self.logo = _l;
    }
    return self;
}

@end
