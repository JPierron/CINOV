//
//  unRegisteredEvent.h
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface unRegisteredEvent : NSObject

@property (strong, nonatomic) NSArray *idEventUnRegister;

- (id)init;
- (id)initWithTag:(int)tag;
- (void)unRegisterEvent:(int)tag;
@end
