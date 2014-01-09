//
//  MonProfil.h
//  CINOV
//
//  Created by Yoann BRAVI on 02/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonProfil : NSObject {
    NSArray *dataWS;
}

- (id)init;
- (void)wsGetUserLogged;
- (NSArray *)getUserLogged;

@end
