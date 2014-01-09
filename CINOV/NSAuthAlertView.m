//
//  NSAuthAlertView.m
//  CINOV
//
//  Created by Yoann BRAVI on 18/05/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "NSAuthAlertView.h"

#define ALERTWIDTH 100
#define LABELMAXHEIGHT 60

@interface UILabel (Allignment)
-(void)alignWithText;
@end

@implementation UILabel (Allignment)

-(void)alignWithText    {
	CGSize labelSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
	CGSize thelabelSize = [self.text sizeWithFont:self.font constrainedToSize:labelSize lineBreakMode:self.lineBreakMode];
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelSize.width, thelabelSize.height);
}

@end

#pragma mark -

@implementation NSAuthAlertView

#pragma mark - Init Method

-(id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate viewTag:(int)iTag   {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        
        self.tag = iTag;
        self.title = title;
        self.message = message;
        self.delegate = delegate;
        [self addButtonWithTitle:@"Annuler"];
        [self addButtonWithTitle:@"Se connecter"];
        
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, (ALERTWIDTH), LABELMAXHEIGHT)];
        label.numberOfLines = 0;
        [label setText:self.title];
        [label alignWithText];
        height = height + label.frame.size.height;
        label.frame = CGRectMake(0, 0, (ALERTWIDTH), LABELMAXHEIGHT);
        [label setText:self.message];
        [label alignWithText];
        height = height + label.frame.size.height;
        label = nil;
        
        
        UITextField *usernameText = [[UITextField alloc] initWithFrame:CGRectMake(25, height, ALERTWIDTH + 80, 24)];
        usernameText.placeholder = @"Nom d'utilisateur";
        usernameText.backgroundColor = [UIColor whiteColor];
        usernameText.tag = (iTag+1000);
        usernameText.autoresizingMask = UIViewAutoresizingNone;
        usernameText.delegate = self;
        usernameText.autocorrectionType = UITextAutocorrectionTypeNo;
        usernameText.autocapitalizationType = UITextAutocapitalizationTypeNone;
        usernameText.returnKeyType = UIReturnKeyNext;
        [usernameText becomeFirstResponder];
        
        [self addSubview:usernameText];
        usernameText = nil;
        
        
        UITextField *passwordText = [[UITextField alloc] initWithFrame:CGRectMake(25, height + 30, ALERTWIDTH + 80, 24)];
        passwordText.placeholder = @"Password";
        passwordText.secureTextEntry = YES;
        passwordText.backgroundColor = [UIColor whiteColor];
        passwordText.tag = (iTag+1001);
        passwordText.autoresizingMask = UIViewAutoresizingNone;
        passwordText.delegate = self;
        passwordText.autocorrectionType = UITextAutocorrectionTypeNo;
        passwordText.autocapitalizationType = UITextAutocapitalizationTypeNone;
        passwordText.returnKeyType = UIReturnKeyDefault;
        
        [self addSubview:passwordText];
        passwordText = nil;
        height = height + 130;
    }
    return self;
}

#pragma mark - Override Methods

- (void)setFrame:(CGRect)rect {
    if (rect.size.width != super.frame.size.width ||
        rect.size.height != super.frame.size.height) {
        [super setFrame:CGRectMake(0, 0, rect.size.width, height)];
        [self setNeedsDisplay];
    }
}

-(void)layoutSubviews   {
    for (UIView *view in self.subviews) {
        if ([[[view class] description] isEqualToString:@"UIAlertButton"]) {
            view.frame = CGRectMake(view.frame.origin.x, self.bounds.size.height - view.frame.size.height - 15, view.frame.size.width, view.frame.size.height);
        }
    }
}

-(void)setNeedsDisplay  {
    self.hidden = YES;
    [self layoutSubviews];
    CGSize windowSize = [UIScreen mainScreen].applicationFrame.size;
    self.center = CGPointMake(windowSize.width/2, 150);
    self.hidden = NO;
}

#pragma mark - UITextField Delegete

- (void)textFieldDidBeginEditing:(UITextField *)textField   {
    
    if (textField.tag == (self.tag + 1001))   {
        keyBoardHeightCorrection = 0.0;
        [self setNeedsDisplay];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField  {
    
    if (textField.tag == (self.tag + 1000)) {
         UITextField *passwordTextField = (UITextField *)[self viewWithTag:(self.tag + 1001)];
        [passwordTextField becomeFirstResponder];
        
        keyBoardHeightCorrection = 0.0;
        [self setNeedsDisplay];
    }
    else if (textField.tag == (self.tag + 1001))   {
        [textField resignFirstResponder];
        
        keyBoardHeightCorrection = 0.0;
        [self setNeedsDisplay];
    }
    
    [self resignFirstResponder];
    
    return YES;
}

@end
