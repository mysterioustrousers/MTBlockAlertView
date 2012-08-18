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
    MTBlockAlertView *alertView = [[MTBlockAlertView alloc] initWithTitle:@"Init Version"
                                                                  message:@"You tapped the init version"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"Cancel"
                                                        otherButtonTitles:@"OK", nil];
    
    alertView.delegate = alertView; // This is currently required since you can't override
                                    // the initWithTitle initializer properly due to the
                                    // otherButtonTitles variable argument list.
    
    [alertView setDidDismissWithButtonIndexBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            [MTBlockAlertView showWithTitle:@"Cancel" message:@"You tapped Cancel"];
        } else {
            [MTBlockAlertView showWithTitle:@"OK" message:@"You tapped OK"];
        }
    }];
    
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
