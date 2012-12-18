//
//  ViewController.m
//  MTBlockAlertViewDemo
//
//  Created by Parker Wightman on 8/17/12.
//  Copyright (c) 2012 Mysterious Trousers. All rights reserved.
//

#import "ViewController.h"
#import <MTBlockAlertView/MTBlockAlertView.h>

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)initVersionTapped:(id)sender {
  
    void (^completionHandler)(UIAlertView *, NSInteger) = ^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (buttonIndex == alertView.cancelButtonIndex) {
            [MTBlockAlertView showWithTitle:@"Cancel" message:@"You tapped Cancel"];
        } else {
            [MTBlockAlertView showWithTitle:@"OK" message:@"You tapped OK"];
        }
    };

    MTBlockAlertView *alertView = [[MTBlockAlertView alloc] initWithTitle:@"Init Version"
                                                                  message:@"You tapped the init version"
                                                        completionHanlder:completionHandler
                                                        cancelButtonTitle:@"Cancel"
                                                        otherButtonTitles:@"OK", nil];
    
    
    [alertView show];
}

- (IBAction)showVersionTapped:(id)sender {
    [MTBlockAlertView showWithTitle:@"Show Version"
                            message:@"You tapped the show version"
                  cancelButtonTitle:@"Cancel"
                   otherButtonTitle:@"OK"
                     alertViewStyle:UIAlertViewStyleDefault
                    completionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                        if (buttonIndex == 0) {
                            [MTBlockAlertView showWithTitle:@"Cancel" message:@"You tapped Cancel"];
                        } else {
                            [MTBlockAlertView showWithTitle:@"OK" message:@"You tapped OK"];
                        }
                    }];
}

@end
