//
//  QuestionEvent.h
//  CINOV
//
//  Created by Yoann BRAVI on 20/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionEvent : NSObject {
    NSArray *dataWS;
}

- (id)init;
- (id)initWith:(NSString *)methode eventId:(int)eventId questionId:(int)questionId;
- (void)wsGetQuestion:(int)eventId;
- (void)wsPostQuestion:(int)eventId;
- (void)wsVoteQuestion:(int)eventId questionId:(int)questionId;
- (void)wsUnvoteQuestion:(int)eventId questionId:(int)questionId;
- (NSArray *)getQuestion;
- (NSArray *)postQuestion;
- (NSArray *)voteQuestion;
- (NSArray *)unvoteQuestion;

@end
