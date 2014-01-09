//
//  DisplayableImage.h
//  CINOV
//
//  Created by Jean Pierron on 2/9/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisplayableImage : NSObject

@property (strong, nonatomic) UIImage* image;
@property (nonatomic) BOOL status;

- (id) init;
- (id) initWithTitle:(UIImage *)_image _status:(BOOL)_status;

@end
