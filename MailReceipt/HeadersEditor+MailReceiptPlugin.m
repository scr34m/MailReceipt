//
//  HeadersEditor+MailReceiptPlugin.m
//  MailReceipt
//
//  Created by Gyorvari Gabor on 2016. 09. 16..
//  Copyright © 2016. Gyorvari Gabor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "HeadersEditor+MailReceiptPlugin.h"
#import <HeadersEditor.h>
#import <ComposeBackEnd.h>
#import "MailReceiptPlugin.h"
#import <ComposeViewController.h>
#import "NSObject+LPDynamicIvars.h"

@implementation HeadersEditor_MailReceiptPlugin

- (void)readReceiptClicked:(id)sender {
    NSSegmentedControl *readButton = [self getIvar:@"_readButton"];
    
    HeadersEditor *editor = (HeadersEditor *)self;
    ComposeViewController *composeViewController = editor.composeViewController;
    ComposeBackEnd *backEnd = composeViewController.backEnd;
    
    if ([[backEnd getIvar:@"readReceipt"] boolValue]) {
        [readButton setSelected:FALSE forSegment:0];
        [backEnd setIvar:@"readReceipt" value:@NO];
    } else {
        [readButton setSelected:TRUE forSegment:0];
        [backEnd setIvar:@"readReceipt" value:@YES];
    }
}

- (void)deliveryReceiptClicked:(id)sender {
    NSSegmentedControl *deliveryButton = [self getIvar:@"_deliveryButton"];
    
    HeadersEditor *editor = (HeadersEditor *)self;
    ComposeViewController *composeViewController = editor.composeViewController;
    ComposeBackEnd *backEnd = composeViewController.backEnd;
    
    if ([[backEnd getIvar:@"deliveryReceipt"] boolValue]) {
        [deliveryButton setSelected:FALSE forSegment:0];
        [backEnd setIvar:@"deliveryReceipt" value:@NO];
    } else {
        [deliveryButton setSelected:TRUE forSegment:0];
        [backEnd setIvar:@"deliveryReceipt" value:@YES];
    }
}

- (void)MPPAwakeFromNib {
    /*
     El Capitan + Sierra
     NSStackView
       +- NSTextField (Subject)
       +- NSTextField (Subject)
       +- NSPopUpButton (_priorityPopup)
       +- NSView (_signBlock)
         +- NSSegmentedControl (_encryptButton)
         +- NSSegmentedControl (_signButton)
       +- NSSegmentedControl *_readButton
       +- NSSegmentedControl *_deliveryButton
    */

    NSView *optionalView = [[self valueForKey:@"_signButton"] superview];
    NSStackView *stackView = (NSStackView *)[optionalView superview];

    NSSegmentedControl *readButton = [[NSSegmentedControl alloc] initWithFrame:NSMakeRect(0, 0, 38, 24)];
    readButton.segmentCount = 1;
    [readButton setLabel:@"R" forSegment:0];
    [readButton setWidth:32 forSegment:0];
    [readButton setContinuous:YES];
    ((NSSegmentedCell *)readButton.cell).trackingMode = NSSegmentSwitchTrackingSelectOne;
    readButton.segmentStyle = NSSegmentStyleRounded;
    readButton.target = self;
    readButton.action = @selector(readReceiptClicked:);
    [self setIvar:@"_readButton" value:readButton];
    [stackView addView:readButton inGravity:NSStackViewGravityTrailing];
    
    NSSegmentedControl *deliveryButton = [[NSSegmentedControl alloc] initWithFrame:NSMakeRect(0, 0, 38, 24)];
    deliveryButton.segmentCount = 1;
    [deliveryButton setLabel:@"D" forSegment:0];
    [deliveryButton setWidth:32 forSegment:0];
    [deliveryButton setContinuous:YES];
    ((NSSegmentedCell *)deliveryButton.cell).trackingMode = NSSegmentSwitchTrackingSelectOne;
    deliveryButton.segmentStyle = NSSegmentStyleRounded;
    deliveryButton.target = self;
    deliveryButton.action = @selector(deliveryReceiptClicked:);
    [self setIvar:@"_deliveryButton" value:deliveryButton];
    [stackView addView:deliveryButton inGravity:NSStackViewGravityTrailing];

    [self MPPAwakeFromNib];
}

@end
