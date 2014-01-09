//
//  UpdateParam.h
//  CINOV
//
//  Created by Yoann BRAVI on 21/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpdateParam : NSObject {
    NSArray *dataWS;
}

- (id)init;
- (void)wsUpdateParam;

@end
