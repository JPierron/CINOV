//
//  FicheEvent.h
//  CINOV
//
//  Created by Yoann BRAVI on 25/04/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FicheEvent : NSObject

@property (strong) NSString *event;
@property (strong) NSString *description;

- (id) init;
- (id) initWith:(NSString *)_event _description:(NSString *)_description;

@end
