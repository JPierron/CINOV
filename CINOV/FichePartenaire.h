//
//  FichePartenaire.h
//  CINOV
//
//  Created by Jean Pierron on 5/15/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FichePartenaire : NSObject

@property (strong) NSString *name;
@property (strong) NSString *pageLink;
@property (strong) UIImage *logo;

- (id) init;
- (id) initWith:(NSString *)_n _pL:(NSString *)_pL _l:(UIImage *)_l;

@end
