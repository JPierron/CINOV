//
//  BusinessCard.h
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessCard : NSObject {
    NSArray *dataWS;
}

- (id)init;
- (id)initWith:(NSString *)methode userId:(int)userId;
- (void)wsGetCard;
- (NSArray *)getCards;
- (void)wsPostCard:(int)userId;
- (NSArray *)postCards;

@end
