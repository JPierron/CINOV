//
//  NSAuthAlertView.h
//  CINOV
//
//  Created by Yoann BRAVI on 18/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSAuthAlertView : UIAlertView <UITextFieldDelegate> {
    float height;
    float keyBoardHeightCorrection;
}

-(id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate viewTag:(int)iTag;

@end
