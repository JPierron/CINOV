//
//  RegisteringEvent.h
//  CINOV
//
//  Created by Yoann BRAVI on 11/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisteringEvent : NSObject

@property (strong, nonatomic) NSArray *idEventRegister;

- (id)init;
- (id)initWithTag:(int)tag;
- (void)registerEvent:(int)tag;
@end
