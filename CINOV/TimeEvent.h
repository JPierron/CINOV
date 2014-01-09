//
//  TimeEvent.h
//  CINOV
//
//  Created by Yoann BRAVI on 03/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeEvent : NSObject

@property (strong) NSArray *time;

- (id)init;
- (id)initWith:(NSArray *)_time;

@end
