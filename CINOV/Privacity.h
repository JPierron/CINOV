//
//  Privacity.h
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Privacity : NSObject {
    NSArray *dataWS;
}

- (id)init;
- (id)initWith:(NSString *)methode;
- (void)wsGetPrivacity;
- (NSArray *)getPrivacity;
- (void)wsPostPrivacity;
- (NSArray *)postPrivacity;

@end
