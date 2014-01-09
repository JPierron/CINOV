//
//  DisplayableString.h
//  CINOV
//
//  Created by Jean Pierron on 2/9/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisplayableString : NSObject

@property (strong, nonatomic) NSString* text;
@property (nonatomic) BOOL status;

- (id) init;
- (id) initWithTitle:(NSString *)_text _status:(BOOL)_status;
- (void) setPrivacity:(BOOL)_pStatus;

@end
