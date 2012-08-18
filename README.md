MTBlockAlertView
================

An iOS Alert View that uses block-based delegation instead of protocols.

Installation
============

1. Preferred method is through CocoaPods, add `pod 'MTBlockAlertView'` to your Podfile.
2. Copy `MTBlockAlertView.h` and `MTBlockAlertView.m` from the `MTBlockAlertView` target into your project.

Usage
=====

Instead of conforming to the `UIAlertViewDelegate` protocol, use blocks instead:

```
MTBlockAlertView *alertView = [[MTBlockAlertView alloc] initWithTitle:@"Init Version"
                                                                  message:@"You tapped the init version"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"Cancel"
                                                        otherButtonTitles:@"OK", nil];
    
alertView.delegate = alertView; // This is currently required since you can't override
                                // the initWithTitle initializer properly due to the
                                // otherButtonTitles variable argument list.

[alertView setDidDismissWithButtonIndexBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
    ...
}];

[alertView show];
```

Aside from the convenience of not having to conform to the protocol, you also have the benefit of each `MTBlockAlertView` instance being in charge of its own dismissal. Anyone who has tried to use the delegate methods of multiple `UIAlertView`s in the same view controller knows the frustration of it.

We also provide several class convenience methods for common use cases. Run the `MTBlockAlertViewDemo` target to see some examples.

### Super-simple

```
[MTBlockAlertView showWithTitle:@"Cool Message" message:@"This is a really cool message"];
```

### A little more control

```
[MTBlockAlertView showWithTitle:@"Cool Message"
                        message:@"Tapping this will do something cool"
                completionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                    // Do some work
                }];
```

### Full-monty

```
[MTBlockAlertView showWithTitle:@"Cool Message"
                        message:@"I like blocks."
              cancelButtonTitle:@"Cancel"
               otherButtonTitle:@"OK"
                 alertViewStyle:UIAlertViewStylePlainTextInput
                completionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
                    // Do some work
                }];
```
