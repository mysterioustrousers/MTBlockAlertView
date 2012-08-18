//
//  MTBlockAlertView.m
//  MTBlockAlertView
//
//  Created by Parker Wightman on 8/17/12.
//  Copyright (c) 2012 Mysterious Trousers. All rights reserved.
//

#import "MTBlockAlertView.h"

@implementation MTBlockAlertView


#pragma mark Custom Initializers

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.delegate = self;
    }
    
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.delegate = self;
    }
    
    return self;
}

#pragma mark UIAlertViewDelegate methods (optional)

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (_clickedButtonAtIndexBlock) {
        _clickedButtonAtIndexBlock(alertView, buttonIndex);
    }
}

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (_didDismissWithButtonIndexBlock) {
        _didDismissWithButtonIndexBlock(alertView, buttonIndex);
    }
}

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (_willDismissWithButtonIndexBlock) {
        _willDismissWithButtonIndexBlock(alertView, buttonIndex);
    }
}

- (void) alertViewCancel:(UIAlertView *)alertView {
    if (_cancelBlock) {
        _cancelBlock(alertView);
    }
}

#pragma mark Convenience Methods

+ (void) showWithTitle:(NSString *)title
               message:(NSString *)message
     cancelButtonTitle:(NSString *)cancelButtonTitle
      otherButtonTitle:(NSString *)otherButtonTitle
        alertViewStyle:(UIAlertViewStyle)alertViewStyle
       completionBlock:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))completionBlock {

    MTBlockAlertView *alertView = [[MTBlockAlertView alloc] initWithTitle:title
                                                                  message:message
                                                                 delegate:nil
                                                        cancelButtonTitle:cancelButtonTitle
                                                        otherButtonTitles:otherButtonTitle, nil];
    
    alertView.delegate = alertView;
    
    alertView.alertViewStyle = alertViewStyle;
    
    [alertView setDidDismissWithButtonIndexBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (completionBlock) {
            completionBlock(alertView, buttonIndex);
        }
    }];
    
    [alertView show];
}

+ (void) showWithTitle:(NSString *)title
               message:(NSString *)message
       completionBlock:(void (^)(UIAlertView *alertView))completionBlock {

    MTBlockAlertView *alertView = [[MTBlockAlertView alloc] initWithTitle:title
                                                                  message:message
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles:nil];
    alertView.delegate = alertView;
    
    [alertView setDidDismissWithButtonIndexBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (completionBlock) {
            completionBlock(alertView);
        }
    }];
    
    [alertView show];
}

+ (void) showWithTitle:(NSString *)title
               message:(NSString *)message {

    MTBlockAlertView *alertView = [[MTBlockAlertView alloc] initWithTitle:title
                                                                  message:message
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alertView.delegate = alertView;
    
    [alertView show];
}

@end
